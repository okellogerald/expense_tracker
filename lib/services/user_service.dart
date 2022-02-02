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
  static const google = 'google';
  static const facebook = 'facebook';
  // ignore: constant_identifier_names
  static const email_password = 'email_password';
}

class UserService {
  UserService(this.client);

  final SupabaseClient client;

  static const _usersTable = 'Users';
  static const _otpVerificationTable = 'OTP';

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

      log(result.data ?? 'no data');

      final doesExist = result.data.isNotEmpty;
      if (doesExist) throw DatabaseError.emailAvailable();

      final data = {
        'email': email,
        'password': password,
        'provider': Providers.email_password,
        'backUpOption': BackUpOptions.daily
      };

      final user = User.empty().copyWith(email: email);
      await _box.put(kUser, user);
      return user;
    } on DatabaseError catch (_) {
      rethrow;
    }
  }

  Future<PostgrestResponse?> _insertTo(String values) async {
    await client.from(_usersTable).insert(values).execute().then((value) {
      return value;
    }).catchError((error) => _handleError(error));
  }

  _handleError(dynamic error) {
    log('handling the error');
    switch (error) {
      case SocketException:
      case TimeoutException:
        throw DatabaseError.internet();
      case PostgrestError:
        throw DatabaseError.postgrestError();
      case DatabaseError:
        throw error;
      default:
        throw DatabaseError.specific(error.message);
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
    } on PostgrestError catch (e) {
      throw DatabaseError.specific(e.message);
    } on DatabaseError catch (_) {
      rethrow;
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
    }
  }

  Future<void> sendOTP(String email) async {
    log('started in the sending OTP');

    final otp = Utils.generateOTP();

    try {
      final result = await client
          .from(_otpVerificationTable)
          .select()
          .match({'email': email}).execute();

      log(' in the sending OTP');

      log(result.error?.message ?? 'no error');

      final doesExist = result.data?.isNotEmpty ?? false;
      final hasError = result.error != null;
      if (hasError) throw DatabaseError.unknown();

      if (doesExist) {
        log('in here');
        final result = await client
            .from(_otpVerificationTable)
            .update({'OTP': otp})
            .eq('email', email)
            .execute();

        log(result.error?.message ?? 'no error');
        final hasError = result.error != null;
        if (hasError) throw DatabaseError.unknown();
      } else {
        final result = await client
            .from(_otpVerificationTable)
            .insert({'email': email, 'OTP': otp}).execute();

        log(result.error?.message ?? 'no error');
        final hasError = result.error != null;
        if (hasError) throw DatabaseError.unknown();
      }

      const key = 'lLRz4FQyJDRYC5Hp1JmkyA';

      var headers = {
        'Content-Type': 'application/json',
      };

      final message = {
        "key": key,
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

      var response = await http.post(
          Uri.parse('https://mandrillapp.com/api/1.0/messages/send'),
          headers: headers,
          body: json.encode(message));

      if (response.statusCode != 200) throw DatabaseError.internet();
    } on SocketException catch (_) {
      throw DatabaseError.internet();
    } on TimeoutException catch (_) {
      throw DatabaseError.internet();
    } on DatabaseError catch (_) {
      rethrow;
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
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
    log('Starting the verification process');

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
    } on DatabaseError catch (_) {
      rethrow;
    } on SocketException catch (_) {
      throw DatabaseError.internet();
    } on TimeoutException catch (_) {
      throw DatabaseError.internet();
    } catch (_) {
      throw DatabaseError.unknown();
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
          result = await client.from(_usersTable).insert({
            'email': email,
            'password': password,
            'provider': Providers.email_password,
            'backUpOption': BackUpOptions.daily,
          }).execute();

          var hasError = result.error != null;
          if (hasError) throw DatabaseError.unknown();

          result = await client
              .from(_otpVerificationTable)
              .delete()
              .eq('email', email)
              .execute();

          hasError = result.error != null;
          if (hasError) throw DatabaseError.postgrestError();

          final user = User.empty().copyWith(email: email);
          await _box.put(kUser, user);
          return user;
        }
      } else {
        throw DatabaseError.unknown();
      }
    } on SocketException catch (_) {
      throw DatabaseError.internet();
    } on TimeoutException catch (_) {
      throw DatabaseError.internet();
    } on DatabaseError catch (_) {
      rethrow;
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
    }
  }

  Future<User?> updateUser(
      {required String email,
      required String name,
      required int currency,
      String? backUpOption}) async {
    try {
      // final path = 'users.image/$email.png';
      // await client.storage.from('users.image').upload(path, file);
      // final bytes = await client.storage.from('users.image').download(path);
      final result = await client
          .from(_usersTable)
          .update({'display_name': name, 'currency': currency.toString()})
          .eq('email', email)
          .execute();

      final hasError = result.error != null;
      if (hasError) throw DatabaseError.postgrestError();

      final user =
          User.empty().copyWith(email: email, currency: currency, name: name);
      await _box.put(kUser, user);
      return user;
    } on PostgrestError catch (e) {
      throw DatabaseError.specific(e.message);
    } on DatabaseError catch (_) {
      rethrow;
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
    }
  }

  Future<User?> signUpWithGoogle() async {
    final user = await _initGoogle();

    if (user != null) {
      await _signUp(user, '', provider: Providers.google);
      return user;
    }
    //else returns null
  }

  Future<User?> signUpWithFacebook() async {
    final user = await _initFacebook();

    if (user != null) {
      await _signUp(user, '', provider: Providers.facebook);
      return user;
    }
    //else returns null
  }

  Future<User?> logInWithGoogle() async {
    final user = await _initGoogle();

    if (user != null) {
      await _logIn(user, provider: Providers.google);
      return user;
    }
    //else returns null
  }

  Future<User?> logInWithFacebook() async {
    final user = await _initFacebook();

    if (user != null) {
      await _logIn(user, provider: Providers.facebook);
      return user;
    }
    //else returns null
  }

  Future<void> _signUp(User user, String password,
      {String provider = Providers.email_password}) async {
    await _checkIfUserExistsDuringSignup(user.email, password);

    try {
      await client.from(_usersTable).insert({
        'email': user.email,
        'password': password,
        'name': user.displayName,
        'photo_url': user.photoUrl,
        'provider': provider,
        'backUpOption': BackUpOptions.daily,
      }).execute();
    } on PostgrestError catch (e) {
      throw DatabaseError.specific(e.message);
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
    }
  }

  Future<void> _logIn(User user,
      {String provider = Providers.email_password}) async {
    try {
      final result = await client
          .from(_usersTable)
          .select()
          .match({'email': user.email}).execute();
      final doesNotExist = result.data.isEmpty;
      if (doesNotExist) {
        await client.from('Users').insert({
          'email': user.email,
          'password': '',
          'name': user.displayName,
          'photo_url': user.photoUrl,
          'provider': provider,
          'backUpOption': BackUpOptions.daily,
        }).execute();
      }
    } on PostgrestError catch (e) {
      throw DatabaseError.specific(e.message);
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
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
    } on PostgrestError catch (e) {
      log(e.message.toString());
      throw DatabaseError.specific(e.message);
    } on DatabaseError catch (_) {
      rethrow;
    } catch (error) {
      log(error.toString());
      throw DatabaseError.unknown();
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
        _box.put(kUser, user);
        return user;
      }
      //else returns null
    } on SocketException catch (_) {
      throw DatabaseError.internet();
    } on TimeoutException catch (_) {
      throw DatabaseError.internet();
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
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
        _box.put(kUser, user);
        return user;
      }
      //else returns null
    } on SocketException catch (_) {
      throw DatabaseError.internet();
    } on TimeoutException catch (_) {
      throw DatabaseError.internet();
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
    }
  }
}
