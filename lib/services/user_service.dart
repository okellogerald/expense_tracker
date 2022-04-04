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
const root = 'https://kkssl6-ip-197-186-1-105.expose.sh';
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

  //userPassword is stored here to be used for deleteAccount purposes.
  //Assigned to this variable after successful sign-up or sign-in processes only.
  var _userPassword = '';
  var _isFirebasePasswordAlreadyChanged = false;

  User get getUser => _user;
  bool get isUserLoggedIn => _box.get(kUser) != null;

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
            .catchError((e) => _handleError(e));
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
          email: email, password: 'default_password@expense_tracker');
      final user = userCredential.user;
      //if user is still null
      if (user == null) throw ApiErrors.failedToCheckEmailVerificationStatus();
      //else
      if (user.emailVerified) _user = _user.copyWith(email: email);
      if (!user.emailVerified) throw ApiErrors.emailNotVerified(email);
    } catch (e) {
      _handleError(e, true);
    }
  }

  ///takes a complete user from the bloc and a password
  Future<void> signUp(User user, String password) async {
    try {
      if (user.isSignedUpWithEmailAndPassword &&
          !_isFirebasePasswordAlreadyChanged) {
        //signing in with the default password won't work because after being
        //verified it is changed. This is necessary to check because this
        //first operation may be successful and the second may not
        final userCredential = await _auth.signInWithEmailAndPassword(
            email: user.email, password: 'default_password@expense_tracker');
        final firebaseUser = userCredential.user;
        await firebaseUser!.updatePassword(password).timeout(timeLimit);
        _isFirebasePasswordAlreadyChanged = true;
      }
      final body = Map.from(user.toJson())..addAll({"password": password});
      //to be converted to x-www-url-encoded, the body is supposed to be in type
      //Map<String,String> only.
      body['currency'] = (body['currency'] as int).toString();
      final response = await http
          .post(Uri.parse('$root/user/create'), body: body, headers: headers)
          .timeout(timeLimit);
      _handleStatusCode(response);
      _user = user;
      _userPassword = password;
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    final body = {"password": password};
    try {
      final response = await http
          .post(Uri.parse('$root/user?email=$email'),
              body: body, headers: headers)
          .timeout(timeLimit);
      _handleStatusCode(response);
      final jsonUser = json.decode(response.body)['user'];
      _user = User.fromJson(jsonUser);
      _userPassword = password;
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
    final account = await _google.signIn().catchError((e) => _handleError(e));
    if (account != null) {
      _user = User.fromGoogleAccount(account);
      return true;
    }
    return false;
  }

  _handleError(dynamic error, [bool isVerifyingEmail = false]) {
    if (error is SocketException || error is TimeoutException) {
      throw ApiErrors.internet();
    } else if (error is ApiErrors) {
      throw error;
    } else if (error is FirebaseAuthException) {
      //when verifying if the user has verified the email address, we sign-in
      //to his account.
      final code = error.code;
      if ((code == 'invalid-email' ||
              code == 'user-disabled' ||
              code == 'user-not-found') &&
          isVerifyingEmail) {
        throw ApiErrors.failedToCheckEmailVerificationStatus();
      }
      throw ApiErrors(error.message ?? error.code);
    } else {
      throw ApiErrors.unknown();
    }
  }

  _handleStatusCode(http.Response response) {
    final responseBody = json.decode(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ApiErrors(responseBody['error']);
    }
  }

  Future<void> signOut() async {
    final user = _box.get(kUser) as String?;
    if (user == null) return;
    await _box.delete(kUser);
  }

  Future<void> deleteAccount() async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: _user.email, password: _userPassword);
      await userCredential.user!.delete();
      await http
          .delete(Uri.parse('$root/user/?email=${_user.email}'),
              headers: headers)
          .timeout(timeLimit);
    } catch (e) {
      _handleError(e);
    }
  }
}
