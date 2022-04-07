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
const root = 'https://ltje0n-ip-197-186-1-86.expose.sh';
const headers = {'Content-Type': 'application/x-www-form-urlencoded'};
const facebookRoot =
    'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),email';

class UserService {
  UserService() {
    final jsonUser = _box.get(kUser) as String?;
    if (jsonUser == null) return;
    _user = User.fromJson(json.decode(jsonUser));
  }

  var _user = const User();
  final _box = Hive.box(kUser);
  final _googleSignIn = GoogleSignIn();
  final _facebookAuth = FacebookAuth.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  //userPassword is stored here to be used for deleteAccount purposes.
  //Assigned to this variable after successful sign-up or sign-in processes only.
  var _userPassword = '';
  var _isFirebasePasswordAlreadyChanged = false;

  User get getUser => _user;
  bool get isUserLoggedIn => _box.get(kUser) != null;

  ///for users signing up with email & password
  Future<void> sendEmailVerificationEmail(String email) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: 'default_password@expense_tracker');
      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      //if sendingEmailVerification was somehow not successful but creating user
      //operation was.
      if (e.code == 'email-already-in-use') {
        await _firebaseAuth.currentUser!
            .sendEmailVerification()
            .catchError((e) => _handleError(e));
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
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: 'default_password@expense_tracker');
      final user = userCredential.user;
      //if user is still null
      if (user == null) throw UserException.failedToCheckEmailVerificationStatus();
      //else
      if (user.emailVerified) _user = _user.copyWith(email: email);
      if (!user.emailVerified) throw UserException.emailNotVerified(email);
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
        final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
            email: user.email, password: 'default_password@expense_tracker');
        final firebaseUser = userCredential.user;
        await firebaseUser!.updatePassword(password).timeout(timeLimit);
        _isFirebasePasswordAlreadyChanged = true;
      }
      final body = Map.from(user.toJson())..addAll({"password": password});
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

  Future<void> logIn(String email, String password) async {
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
      final result = await _facebookAuth.login();
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
    await _googleSignIn.disconnect().catchError((_) {});
    final account =
        await _googleSignIn.signIn().catchError((e) => _handleError(e));
    if (account != null) {
      _user = User.fromGoogleAccount(account);
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    final user = _box.get(kUser) as String?;
    if (user == null) return;
    await _box.delete(kUser);
  }

  Future<void> deleteAccount() async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
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

  _handleError(dynamic error, [bool isVerifyingEmail = false]) {
    if (error is SocketException || error is TimeoutException) {
      throw UserException.internet();
    } else if (error is UserException) {
      throw error;
    } else if (error is FirebaseAuthException) {
      //when verifying if the user has verified the email address, we sign-in
      //to his account.
      final code = error.code;
      if ((code == 'invalid-email' ||
              code == 'user-disabled' ||
              code == 'user-not-found') &&
          isVerifyingEmail) {
        throw UserException.failedToCheckEmailVerificationStatus();
      }
      throw UserException(error.message ?? error.code);
    } else {
      throw UserException.unknown();
    }
  }

  _handleStatusCode(http.Response response) {
    final responseBody = json.decode(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw UserException(responseBody['error']);
    }
  }
}
