import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/providers/user_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../constants.dart';
import '../errors/exception_handler.dart';
import '../errors/user_exception.dart';
import '../states/user_state.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref.read));

class UserNotifier extends StateNotifier<UserState> {
  final Reader read;
  UserNotifier(this.read) : super(const UserState.initial());

  Future<void> sendEmailVerificationLink() async {
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    state = const UserState.loading();
    try {
      await read(userRepositoryProvider)
          .createFirebaseUser(user.email, password);
      await read(userRepositoryProvider)
          .sendVerificationLink(user.email, password);
      state = const UserState.done();
    } on FirebaseAuthException catch (e) {
      //if sendingEmailVerification was somehow not successful but creating user
      //operation was. Creating a user second time will show this error.
      if (e.code == 'email-already-in-use') {
        await read(userRepositoryProvider)
            .sendVerificationLink(user.email, password)
            .catchError((e) => handleError(e));
      }
      state = const UserState.done();
    } catch (error) {
      _handleError(error);
    }
  }

  ///used only when signing up to check whether a user has verified the email.
  ///throws an error if operation is not successful.
  Future<void> checkIfEmailIsVerified() async {
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    state = const UserState.loading();

    //have to re-sign-in because auth.currentUser just gives a snapshot based on
    //the prev sign-in or sign-up but doesn't react to user state changes
    try {
      final userCredential = await read(userRepositoryProvider)
          .signInFirebaseUser(user.email, password);
      final firebaseUser = userCredential.user;
      //if user is still null
      if (firebaseUser == null) {
        throw UserException.failedToCheckEmailVerificationStatus();
      }
      //else
      if (firebaseUser.emailVerified) {
        state = const UserState.done();
      } else {
        throw UserException.emailNotVerified(user.email);
      }
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> signUp() async {
    state = const UserState.loading();
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);

    try {
      if (user.isSignedUpWithEmailAndPassword) {
        //Reaching this stage means user is verified. Hence changing the
        //user details in firebase to match the given password instead of the default
        final userCredential = await read(userRepositoryProvider)
            .signInFirebaseUser(user.email, password);
        final firebaseUser = userCredential.user;
        await firebaseUser!.updatePassword(password).timeout(timeLimit);
      }
      final body = Map<String, String>.from(user.toJson())
        ..addAll({"password": password});
      await read(userRepositoryProvider).createUserInDatabase(body);
      read(userDetailsProvider.state).state = user;
      state = const UserState.done();
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> logIn() async {
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    state = const UserState.loading();
    final userData = await read(userRepositoryProvider)
        .signInUserInDatabase(user.email, password)
        .catchError(_handleError);
    read(userDetailsProvider.state).state = userData;
    state = const UserState.done();
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
    state = UserState.failed(message: message);
  }
}
