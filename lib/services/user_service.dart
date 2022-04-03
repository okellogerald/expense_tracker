import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:budgetting_app/source.dart' hide Provider;
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http hide User;

const timeLimit = Duration(seconds: 10);
const root = '';
const headers = {'Content-Type': 'application/json'};

class UserService {
  UserService(this._auth) {
    final jsonUser = _box.get(kUser) as String?;
    if (jsonUser == null) return;
    _user = User.fromJson(json.decode(jsonUser));
  }

  late User? _user;
  final FirebaseAuth _auth;
  final _box = Hive.box(kUser);
  final _google = GoogleSignIn();
  final _facebook = FacebookAuth.instance;

  User? get getUser => _user;

  ///returns null if can't remember who the user is (session expired).
  ///Hence the user has to start the process again.
  bool? get isEmailVerified => _auth.currentUser?.emailVerified;

  ///for users signing up with email & password
  Future<void> sendEmailForVerification(String email) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: 'default_password@expense_tracker');
      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      //if user had already provided email and wanted to verify it but did not
      //finish the process, hence was not verified.
      if (e.code == 'email-already-in-use') {
        await _auth.currentUser!.sendEmailVerification();
      } else {
        _handleError(e);
      }
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> signUp(User user, String password) async {
    try {
      if (user.signUpOption == SigningUpOptions.email_password) {
        await _auth.currentUser!.updatePassword(password).timeout(timeLimit);
      }
      final data = Map.from(user.toJson())..addAll({"password": password});
      await http
          .post(Uri.parse('$root/user/create'),
              body: json.encode(data), headers: headers)
          .timeout(timeLimit);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    final data = {"password": password};
    try {
      await http
          .post(Uri.parse('$root/user?email=$email'),
              body: json.encode(data), headers: headers)
          .timeout(timeLimit);
    } catch (e) {
      _handleError(e);
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
    return null;
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
    return null;
  }

  _handleError(dynamic error) {
    if (error is SocketException || error is TimeoutException) {
      throw ApiError.internet();
    } else if (error is ApiError) {
      throw error;
    } else if (error is FirebaseAuthException) {
      throw ApiError(error.message ?? error.code);
    } else {
      throw ApiError.unknown();
    }
  }

  Future<void> signOut() async => await _box.delete(kUser);
}
