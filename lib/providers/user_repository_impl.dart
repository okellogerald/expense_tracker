import 'dart:convert';

import 'package:budgetting_app/source.dart' hide Provider;
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../errors/api_error.dart';

const timeLimit = Duration(seconds: 15);
const headers = {'Content-Type': 'application/x-www-form-urlencoded'};

final userRepositoryProvider =
    Provider<UserRepositoryImpl>((ref) => UserRepositoryImpl());

abstract class UserRepositoryInterface {
  ///creates a new user with [firebase_auth] using email/password
  Future<UserCredential> createFirebaseUser(String email, String password);

  ///uses [firebase_auth] to send email verification link
  Future<void> sendVerificationLink(String email, String password);

  ///uses [firebase_auth] to sign in a user using email/password combination
  Future<void> signInFirebaseUser(String email, String password);

  ///creates a new user in the database
  Future<User> createUserInDatabase(Map<String, String> user);

  ///checks if user is in the database.
  Future<User> signInUserInDatabase(String email, String password);

  ///deletes user from the database and also from firebase if was signed in
  ///using email/password
  Future<void> deleteUser(String email, String password);

  ///uses [googleSignIn] to pop-up a dialog to get selected account user details
  Future<User?> getUserGoogleAccountDetails();

  ///uses [facebookAuth] to pop-up a dialog to get selected account user details
  Future<User?> getUserFacebookAccountDetails();
}

class UserRepositoryImpl implements UserRepositoryInterface {
  final _firebaseAuth = FirebaseAuth.instance;
  var _isAlreadyDeletedFromDatabase = false;
  final _googleSignIn = GoogleSignIn();
  final _facebookAuth = FacebookAuth.instance;

  @override
  Future<UserCredential> createFirebaseUser(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(timeLimit);
      return credential;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User> createUserInDatabase(Map<String, String> userMap) async {
    try {
      final response = await http
          .post(Uri.parse('$root/user/create'), body: userMap, headers: headers)
          .timeout(timeLimit);
      _handleResponseErrors(response);
      final jsonUser = json.decode(response.body)['user'];
      return User.fromJson(jsonUser);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(String email, String password) async {
    try {
      //deleting from the database
      //If deleting from database is successful and not from firebase. Calling
      //this function again will bring an error.
      if (!_isAlreadyDeletedFromDatabase) {
        final response = await http
            .delete(Uri.parse('$root/user/?email=$email'), headers: headers)
            .timeout(timeLimit);
        _handleResponseErrors(response);
        _isAlreadyDeletedFromDatabase = true;
      }

      //deleting from firebase
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user!.delete();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> sendVerificationLink(String email, String password) async {
    try {
      var user = _firebaseAuth.currentUser;
      if (user == null) {
        final credential = await signInFirebaseUser(email, password);
        user = credential.user!;
      }
      await user.sendEmailVerification();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signInFirebaseUser(
      String email, String password) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(timeLimit);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User> signInUserInDatabase(String email, String password) async {
    final body = {"password": password};
    try {
      final response = await http
          .post(Uri.parse('$root/user?email=$email'),
              body: body, headers: headers)
          .timeout(timeLimit);
      _handleResponseErrors(response);
      final jsonUser = json.decode(response.body)['user'];
      return User.fromJson(jsonUser);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User?> getUserFacebookAccountDetails() async {
    try {
      final result = await _facebookAuth.login();
      if (result.status == LoginStatus.success) {
        final profile = await _facebookAuth.getUserData(
            fields: "name,email,picture.width(200)");
        return User.fromFacebookProfile(profile);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User?> getUserGoogleAccountDetails() async {
    try {
      await _googleSignIn.disconnect().catchError((_) {});
      final account = await _googleSignIn.signIn();
      if (account != null) return User.fromGoogleAccount(account);
      return null;
    } catch (error) {
      rethrow;
    }
  }

  ///checks to see if response has errors
  _handleResponseErrors(http.Response response) {
    final responseBody = json.decode(response.body);
    final error = responseBody['error'] as Map<String, dynamic>?;
    if (error == null) return;
    if (error.isNotEmpty) throw ApiError.fromJson(error);
  }
}
