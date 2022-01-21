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

  final _box = Hive.box(kClient);
  final _google = GoogleSignIn();
  final _facebook = FacebookAuth.instance;

  Client get getClient => _box.get(kClient) as Client;
  bool get isLoggedIn => _box.isNotEmpty;

  Future<Client?> signUpWithGoogle() async {
    final client = await _initGoogle();

    if (client != null) {
      await _signUp(client.email, '', provider: Providers.google);
      return client;
    }
    //else returns null
  }

  Future<Client?> signUpWithFacebook() async {
    final client = await _initFacebook();

    if (client != null) {
      await _signUp(client.email, '', provider: Providers.facebook);
      return client;
    }
    //else returns null
  }

  Future<Client?> logInWithGoogle() async {
    final client = await _initGoogle();

    if (client != null) {
      await _logIn(client.email, provider: Providers.google);
      return client;
    }
    //else returns null
  }

  Future<Client?> logInWithFacebook() async {
    final client = await _initFacebook();

    if (client != null) {
      await _logIn(client.email, provider: Providers.facebook);
      return client;
    }
    //else returns null
  }

  Future<void> _signUp(String email, String password,
      {String provider = Providers.email_password}) async {
    await _checkIfUserExistsDuringSignup(email, password);

    try {
      await client.from('Users').insert({
        'email': email,
        'password': password,
        'provider': provider
      }).execute();
    } on PostgrestError catch (e) {
      throw DatabaseError.specific(e.message);
    } catch (_) {
      log(_.toString());
      throw DatabaseError.unknown();
    }
  }

  Future<void> _logIn(String email,
      {String provider = Providers.email_password}) async {
    try {
      final result =
          await client.from('Users').select().match({'email': email}).execute();
      final doesNotExist = result.data.isEmpty;
      if (doesNotExist) {
        await client.from('Users').insert(
            {'email': email, 'password': '', 'provider': provider}).execute();
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
      final result =
          await client.from('Users').select().match({'email': email}).execute();
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
  Future<Client?> _initFacebook() async {
    try {
      final result = await _facebook.login();

      if (result.accessToken != null) {
        final url =
            'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),email&access_token=${result.accessToken!.token}';

        var response = await http.get(Uri.parse(url));
        var profile = json.decode(response.body);
        final client = Client.fromFacebookProfile(profile);
        _box.put(kClient, client);
        return client;
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
  Future<Client?> _initGoogle() async {
    try {
      try {
        await _google.disconnect();
      } catch (_) {}

      final account = await _google.signIn();
      if (account != null) {
        final client = Client.fromGoogleAccount(account);
        _box.put(kClient, client);
        return client;
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
