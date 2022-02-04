import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:budgetting_app/source.dart' hide Provider;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:supabase/supabase.dart' hide User;
import 'package:http/http.dart' as http;

class Providers {
  // ignore: constant_identifier_names
  static const email_password = 'Email & Password';
  static const google = 'Google';
  static const facebook = 'Facebook';
}

class UserService {
  UserService(this.client);

  final SupabaseClient client;

  static const _usersTable = 'Users';
  static const _otpVerificationTable = 'OTP';
  static const timeLimit = Duration(seconds: 10);

  final _box = Hive.box(kUser);
  final _google = GoogleSignIn();
  final _facebook = FacebookAuth.instance;

  User get getUser => _box.get(kUser) as User;
  bool get isLoggedIn => _box.isNotEmpty;

  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final result = await client
          .from(_usersTable)
          .select()
          .match({'email': email}).execute();

      final doesExist = result.data.isNotEmpty;
      if (doesExist) throw DatabaseError.emailAvailable();

      final values = {
        'email': email,
        'password': password,
        'provider': Providers.email_password,
        'backUpOption': BackUpOptions.daily
      };

      await _insertToUsersTable(json.encode(values)).timeout(timeLimit);

      final user = User.empty().copyWith(email: email);
      await _box.put(kUser, user);
      return user;
    } catch (_) {
      _handleError(_);
    }
  }

  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      final result = await client
          .from(_usersTable)
          .select()
          .match({'email': email, 'password': password}).execute();

      final doesExist = result.data.isNotEmpty;

      if (!doesExist) throw DatabaseError.invalidDetails();

      final user = User.fromDatabase(result.data.first);
      await _box.put(kUser, user);
      return user;
    } catch (_) {
      _handleError(_);
    }
  }

  Future<void> sendOTP(String email) async {
    const otp = /* Utils.generateOTP() */ '12345';

    try {
      final result = await client
          .from(_otpVerificationTable)
          .select()
          .match({'email': email}).execute();

      final doesExist = result.data?.isNotEmpty ?? false;
      final hasError = result.error != null;
      if (hasError) throw DatabaseError.unknown();

      if (doesExist) {
        final result = await client
            .from(_otpVerificationTable)
            .update({'OTP': otp})
            .eq('email', email)
            .execute();

        final hasError = result.error != null;
        if (hasError) throw DatabaseError.unknown();
      } else {
        final result = await client
            .from(_otpVerificationTable)
            .insert({'email': email, 'OTP': otp}).execute();

        final hasError = result.error != null;
        if (hasError) throw DatabaseError.unknown();
      }

      var headers = {
        'Content-Type': 'application/json',
      };

      final message = _emailVerificationMessage(otp);

      var response = await http.post(
          Uri.parse('https://mandrillapp.com/api/1.0/messages/send'),
          headers: headers,
          body: json.encode(message));

      if (response.statusCode != 200) throw DatabaseError.internet();
    } catch (_) {
      _handleError(_);
    }
  }

  Map<int, String> updateOTP(Map<int, String> current, int id, int otp) {
    current[id] = otp.toString();
    return current;
  }

  String _generateOTPString(Map<int, String> otp) {
    var otpString = '';
    for (int id = 1; id <= 5; id++) {
      otpString += otp[id]!;
    }
    return otpString;
  }

  Future<void> checkIfRegisteredWithSocial(String email) async {
    try {
      var result = await client
          .from(_usersTable)
          .select()
          .match({'email': email}).execute();

      final hasError = result.error != null;
      if (hasError) throw DatabaseError.postgrestError();

      final data = result.data as List;

      if (data.isEmpty) return;

      if (data.first['provider'] == Providers.facebook) {
        throw DatabaseError.signedByFacebookNotEmailPassword();
      }
      if (data.first['provider'] == Providers.google) {
        throw DatabaseError.signedByGoogleNotEmailPassword();
      }
    } catch (_) {
      _handleError(_);
    }
  }

  Future<User?> verifyEmail(
      String email, String password, Map<int, String> otpMap) async {
    final otp = _generateOTPString(otpMap);

    try {
      var result = await client
          .from(_otpVerificationTable)
          .select()
          .match({'email': email}).execute();

      final doesExist = result.data?.isNotEmpty ?? false;
      final hasError = result.error != null;

      if (hasError) throw DatabaseError.postgrestError();

      if (doesExist) {
        if (otp == result.data.first['OTP']) {
          final values = {
            'email': email,
            'password': password,
            'provider': Providers.email_password,
            'backUpOption': BackUpOptions.daily,
          };
          await _insertToUsersTable(json.encode(values)).timeout(timeLimit);

          var hasError = result.error != null;
          if (hasError) throw DatabaseError.unknown();

          result = await client
              .from(_otpVerificationTable)
              .delete()
              .eq('email', email)
              .execute();

          hasError = result.error != null;
          if (hasError) {
            throw DatabaseError.postgrestError();
          }

          final user = User.empty().copyWith(email: email);
          await _box.put(kUser, user);
          return user;
        }
      } else {
        throw DatabaseError.unknown();
      }
    } catch (_) {
      _handleError(_);
    }
  }

  Future<User?> updateUser(
      {required String email,
      required String name,
      required int currency,
      String? backUpOption}) async {
    try {
      final result = await client
          .from(_usersTable)
          .update({
            'display_name': name,
            'currency': currency.toString(),
            'backUpOption': backUpOption ?? BackUpOptions.daily
          })
          .eq('email', email)
          .execute();

      final hasError = result.error != null;
      if (hasError) throw DatabaseError.postgrestError();

      final user = User.empty().copyWith(
          email: email,
          currency: currency,
          name: name,
          backUpOption: backUpOption);
      await _box.put(kUser, user);
      return user;
    } catch (_) {
      _handleError(_);
    }
  }

  Future<User?> signUpWithGoogle() async {
    var user = await _initGoogle();
    if (user != null) {
      user = await _signUp(user, '', provider: Providers.google);
      return user;
    }
  }

  Future<User?> signUpWithFacebook() async {
    var user = await _initFacebook();
    if (user != null) {
      user = await _signUp(user, '', provider: Providers.facebook);
      return user;
    }
  }

  Future<User?> logInWithGoogle() async {
    var user = await _initGoogle();
    if (user != null) {
      user = await _logIn(user, provider: Providers.google);
      return user;
    }
  }

  Future<User?> logInWithFacebook() async {
    var user = await _initFacebook();
    if (user != null) {
      user = await _logIn(user, provider: Providers.facebook);
      return user;
    }
  }

  Future<User?> _signUp(User user, String password,
      {String provider = Providers.email_password}) async {
    await _checkIfUserExistsDuringSignup(user.email, password);

    try {
      final values = {
        'email': user.email,
        'password': password,
        'display_name': user.displayName,
        'photo_url': user.photoUrl,
        'provider': provider,
        'backUpOption': BackUpOptions.daily,
      };
      await _insertToUsersTable(jsonEncode(values)).timeout(timeLimit);
      _box.put(kUser, user);
    } catch (_) {
      _handleError(_);
    }
  }

  Future<User?> _logIn(User user, {String provider = Providers.google}) async {
    try {
      var result = await client
          .from(_usersTable)
          .select()
          .match({'email': user.email}).execute();

      final doesNotExist = result.data.isEmpty;
      if (doesNotExist) {
        final values = {
          'email': user.email,
          'password': '',
          'display_name': user.displayName,
          'photo_url': user.photoUrl,
          'provider': provider,
          'backUpOption': BackUpOptions.daily,
        };

        await _insertToUsersTable(jsonEncode(values));
        await _box.put(kUser, user);
        return user;
      } else {
        final userProvider = result.data.first['provider'];
        if (provider != userProvider) {
          throw DatabaseError.emailInUse(userProvider);
        } else {
          final user = User.fromDatabase(result.data.first);
          await _box.put(kUser, user);
          return user;
        }
      }
    } catch (_) {
      _handleError(_);
    }
  }

  ///returns true if the user already exist in the database.
  Future<void> _checkIfUserExistsDuringSignup(
      String email, String password) async {
    try {
      final result = await client
          .from(_usersTable)
          .select()
          .match({'email': email}).execute();
      final doesExist = result.data.isNotEmpty;
      if (doesExist) throw DatabaseError.emailAvailable();
    } catch (_) {
      _handleError(_);
    }
  }

  ///returns the client object if the operation is successful. Or else it returns
  ///null if the user didn't select any account or throws an exception indicating
  ///unsuccessful operation.
  Future<User?> _initFacebook() async {
    try {
      final result = await _facebook.login();

      if (result.accessToken != null) {
        final url =
            'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),email&access_token=${result.accessToken!.token}';

        var response = await http.get(Uri.parse(url));
        var profile = json.decode(response.body);
        final user = User.fromFacebookProfile(profile);
        return user;
      }
    } catch (_) {
      _handleError(_);
    }
  }

  ///returns the client object if the operation is successful. Or else it returns
  ///null if the user didn't select any account or throws an exception indicating
  ///unsuccessful operation.
  Future<User?> _initGoogle() async {
    try {
      try {
        await _google.disconnect();
      } catch (_) {}

      final account = await _google.signIn();
      if (account != null) {
        final user = User.fromGoogleAccount(account);
        return user;
      }
    } catch (_) {
      _handleError(_);
    }
  }

  Future<PostgrestResponse?> _insertToUsersTable(String values) async {
    final data = json.decode(values);
    await client.from(_usersTable).insert(data).execute().then((value) {
      return value;
    }).catchError((error) => _handleError(error));
  }

  _handleError(dynamic error) {
    if (error is SocketException || error is TimeoutException) {
      throw DatabaseError.internet();
    } else if (error is DatabaseError) {
      throw error;
    } else if (error is PostgrestError) {
      throw DatabaseError.postgrestError();
    } else {
      throw DatabaseError.unknown();
    }
  }

  Map<String, dynamic> _emailVerificationMessage(String otp) {
    return {
      "key": mandrillKey,
      "message": {
        "from_email": "developer@okellogerald.dev",
        "subject": "Email Verification",
        "text":
            "Hi!\n\nUse the below OTP code to verify your account at Expense Tracker app.\n\n$otp\n\nPlease ignore this email if it was sent against your consent.",
        "to": [
          {"email": "hi@okellogerald.dev", "type": "to"}
        ]
      }
    };
  }

  Future<void> signOut() async => await _box.delete(kUser);
}
