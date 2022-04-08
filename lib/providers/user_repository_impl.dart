import 'dart:convert';

import 'package:budgetting_app/services/services_source.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../errors/exception_handler.dart';
import '../models/user.dart';

const timeLimit = Duration(seconds: 10);
const root = 'https://ltje0n-ip-197-186-1-86.expose.sh';
const headers = {'Content-Type': 'application/x-www-form-urlencoded'};
const facebookRoot =
    'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),email';

final userRepositoryProvider =
    Provider<UserRepositoryImpl>((ref) => UserRepositoryImpl());

abstract class UserRepositoryInterface {
  ///creates a new user with [firebase_auth] using email/password
  Future<UserCredential> createFirebaseUser(String email, String password);

  ///uses [firebase_auth] to send email verification link
  Future<void> sendVerificationLink(String email, String password);

  ///uses [firebase_auth] to signs in a user using email/password combination
  Future<void> signInFirebaseUser(String email, String password);

  ///creates a new user in my database
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
    return await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: email, password: 'default_password@expense_tracker')
        .timeout(timeLimit);
  }

  @override
  Future<User> createUserInDatabase(Map<String, String> userMap) async {
    final response = await http
        .post(Uri.parse('$root/user/create'), body: userMap, headers: headers)
        .timeout(timeLimit);
    _handleStatusCode(response);
    final jsonUser = json.decode(response.body)['user'];
    return User.fromJson(jsonUser);
  }

  @override
  Future<void> deleteUser(String email, String password) async {
    //deleting from the database
    //If deleting from database is successful and not from firebase. Calling
    //this function again will bring an error.
    if (!_isAlreadyDeletedFromDatabase) {
      await http
          .delete(Uri.parse('$root/user/?email=$email'), headers: headers)
          .timeout(timeLimit);
      _isAlreadyDeletedFromDatabase = true;
    }

    //deleting from firebase
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    await userCredential.user!.delete();
  }

  @override
  Future<void> sendVerificationLink(String email, String password) async {
    var user = _firebaseAuth.currentUser;
    user ??= await signInFirebaseUser(email, password)
        .then((credential) => user = credential.user!);
    await user!.sendEmailVerification();
  }

  @override
  Future<UserCredential> signInFirebaseUser(
      String email, String password) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .timeout(timeLimit);
  }

  @override
  Future<User> signInUserInDatabase(String email, String password) async {
    final body = {"password": password};
    final response = await http
        .post(Uri.parse('$root/user?email=$email'),
            body: body, headers: headers)
        .timeout(timeLimit);
    _handleStatusCode(response);
    final jsonUser = json.decode(response.body)['user'];
    return User.fromJson(jsonUser);
  }

  @override
  Future<User?> getUserFacebookAccountDetails() async {
    final result = await _facebookAuth.login();
    if (result.accessToken != null) {
      final url = '$facebookRoot&access_token=${result.accessToken!.token}';
      var response = await http.get(Uri.parse(url));
      var profile = json.decode(response.body);
      return User.fromFacebookProfile(profile);
    }
    return null;
  }

  @override
  Future<User?> getUserGoogleAccountDetails() async {
    await _googleSignIn.disconnect().catchError((_) {});
    final account = await _googleSignIn.signIn();
    if (account != null) return User.fromGoogleAccount(account);
    return null;
  }

  _handleStatusCode(http.Response response) {
    final responseBody = json.decode(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw AppError(responseBody['error']);
    }
  }
}
