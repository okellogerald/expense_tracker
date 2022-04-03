import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:budgetting_app/source.dart' hide Provider;
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

const timeLimit = Duration(seconds: 10);
const root = 'https://yy3fnm-ip-197-186-5-193.expose.sh';
const headers = {'Content-Type': 'application/x-www-form-urlencoded'};
const facebookRoot =
    'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),email';

class UserService {
  UserService(this._auth) {
    final jsonUser = _box.get(kUser) as String?;
    if (jsonUser == null) return;
    _user = User.fromJson(json.decode(jsonUser));
  }

  var _user = const User();
  final FirebaseAuth _auth;
  final _box = Hive.box(kUser);
  final _google = GoogleSignIn();
  final _facebook = FacebookAuth.instance;

  User get getUser => _user;
  bool get isUserLoggedIn => _box.get(kUser) != null;

  _handleCheckingEmailVerificationErrors(var error) async {
    if (error is FirebaseAuthException) {
      final code = error.code;
      if (code == 'invalid-email' ||
          code == 'user-disabled' ||
          code == 'user-not-found') {
        throw ApiError.failedToCheckEmailVerificationStatus();
      }
    } else {
      _handleError(error);
    }
    return null;
  }

  ///for users signing up with email & password
  Future<void> sendEmailVerificationEmail(String email) async {
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
        await _auth.currentUser!
            .sendEmailVerification()
            .catchError(_handleError);
        _user = _user.copyWith(email: email);
      }
    } catch (e) {
      _handleError(e);
    }
  }

  ///used only when signing up to check whether a user has verified the email.
  ///throws an error if operation is not successful.
  Future<void> checkIfEmailIsVerified(String email) async {
    //have to re-sign-in because auth.currentUser just gives a snapshot based on
    //the prev sign-in or sign-up but doesn't react to user state changes
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: _user.email, password: 'default_password@expense_tracker');
      final user = userCredential.user;
      //if user is still null
      if (user == null) throw ApiError.failedToCheckEmailVerificationStatus();
      //else
      if (user.emailVerified) _user = _user.copyWith(email: email);
      if (!user.emailVerified) throw ApiError.emailNotVerified(email);
    } catch (e) {
      _handleCheckingEmailVerificationErrors(e);
    }
  }

  Future<void> signUp(User user, String password) async {
    try {
      if (user.signUpOption == SigningUpOptions.email_password) {
        final userCredential = await _auth.signInWithEmailAndPassword(
            email: _user.email, password: 'default_password@expense_tracker');
        final user = userCredential.user;
        await user!.updatePassword(password).timeout(timeLimit);
      }
      final data = Map.from(user.toJson())..addAll({"password": password});
      print(data);
      final response = await http
          .post(Uri.parse('$root/user/create'),
              body: json.encode(data), headers: headers)
          .timeout(timeLimit);
      final body = json.decode(response.body);
      print(body);
      if (response.statusCode != 200 || response.statusCode != 201) {
        throw ApiError(body['error']);
      }
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

  ///returns [true] after successful operation
  Future<bool> getUserFacebookDetails() async {
    try {
      final result = await _facebook.login();
      if (result.accessToken != null) {
        final url = '$facebookRoot&access_token=${result.accessToken!.token}';
        var response = await http.get(Uri.parse(url));
        var profile = json.decode(response.body);
        _user = User.fromFacebookProfile(profile);
        return true;
      }
    } catch (_) {
      _handleError(_);
    }
    return false;
  }

  ///returns [true] after successful operation
  Future<bool> getUserGoogleDetails() async {
    await _google.disconnect().catchError((_) {});
    final account = await _google.signIn().catchError(_handleError);
    if (account != null) {
      _user = User.fromGoogleAccount(account);
      return true;
    }
    return false;
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
