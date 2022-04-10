import 'dart:async';
import 'dart:developer';
import 'package:budgetting_app/errors/exception_handler.dart';
import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/providers/user_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../errors/user_exception.dart';
import '../models/user.dart';
import '../states/user_state.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref.read));

class UserNotifier extends StateNotifier<UserState> {
  final Reader read;
  UserNotifier(this.read) : super(UserState.initial());

  Future<void> sendEmailVerificationLink() async {
    final user = read(userDetailsProvider);
    Future<void> callback() async {
      await read(userRepositoryProvider)
          .sendVerificationLink(user.email, kDefaultPassword);
    }

    state = const UserState.loading('Sending email verification link ...');
    try {
      await read(userRepositoryProvider)
          .createFirebaseUser(user.email, kDefaultPassword);
      await callback();
      state = const UserState.done();
    } catch (error) {
      //if sendingEmailVerification was somehow not successful but creating user
      //operation was, calling this function second time will show this error.
      if (error is FirebaseAuthException &&
          error.code == 'email-already-in-use') {
        _handleError(UserException.emailInUse());
        return;
      }
      _handleError(error);
    }
  }

  Future<void> checkIfEmailIsVerified() async {
    state = const UserState.loading('Checking if email is verified ...');
    final user = read(userDetailsProvider);
    try {
      final userCredential = await read(userRepositoryProvider)
          .signInFirebaseUser(user.email, kDefaultPassword);
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw UserException.failedToCheckEmailVerificationStatus();
      }
      if (!firebaseUser.emailVerified) {
        throw UserException.emailNotVerified(user.email);
      } else {
        state = const UserState.done();
      }
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> getUserSocialAccountDetails(String signupOption) async {
    assert((signupOption != 'Google' || signupOption != 'Facebook'));
    state = const UserState.loading();
    User? user;
    try {
      if (signupOption == SigningUpOptions.google) {
        user = await read(userRepositoryProvider).getUserGoogleAccountDetails();
      } else if (signupOption == SigningUpOptions.facebook) {
        user =
            await read(userRepositoryProvider).getUserFacebookAccountDetails();
      }
      if (user == null) {
        state = const UserState.content();
      } else {
        read(userDetailsProvider.state).state = user;
      }
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> signUp() async {
    state = const UserState.loading('Creating your account ...');
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    Future<void> callback() async {
      final body = Map<String, String>.from(user.toJson())
        ..addAll({"password": password});
      await read(userRepositoryProvider).createUserInDatabase(body);
      read(userDetailsProvider.state).state = user;
      state = const UserState.done();
    }

    try {
      if (user.isSignedUpWithEmailAndPassword) {
        //Reaching this stage means user is verified. Hence changing the
        //user details in firebase to match the given password instead of the default
        final userCredential = await read(userRepositoryProvider)
            .signInFirebaseUser(user.email, kDefaultPassword);
        final firebaseUser = userCredential.user;
        await firebaseUser!.updatePassword(password).timeout(timeLimit);
      }
      await callback();
    } catch (error) {
      //checks if password changing operation was successful, b'se if it was
      //successful and the method below it is not, running this second time it
      //will show this error
      if (error is FirebaseAuthException && error.code == 'wrong-password') {
        await callback().catchError((e) => _handleError(e));
        return;
      }
      _handleError(error);
    }
  }

  Future<void> logIn() async {
    state = const UserState.loading('Getting your credentials ...');
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    try {
      final userData = await read(userRepositoryProvider)
          .signInUserInDatabase(user.email, password);
      read(userDetailsProvider.state).state = userData;
      state = const UserState.done();
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> signOut() async {
    state = const UserState.loading();
    final user = read(signedInUserProvider);
    if (user != null) await Hive.box(kUser).delete(kUser);
    state = const UserState.done();
  }

  Future<void> deleteAccount() async {
    state = const UserState.loading();
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    await read(userRepositoryProvider)
        .deleteUser(user.email, password)
        .catchError((error) => _handleError(error));
    state = const UserState.done();
  }

  _handleError(var error) {
    final message = getErrorMessage(error);
    log(error.toString());
    log(message);
    state = UserState.failed(message);
  }
}
