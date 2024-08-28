import 'dart:async';
import 'dart:convert';
import 'package:budgetting_app/errors/exception_handler.dart';
import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/providers/user_repository_impl.dart';
import 'package:budgetting_app/source.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../errors/user_exception.dart';
import '../states/user_state.dart';

final userNotifierProvider =
    StateNotifierProvider.autoDispose<UserNotifier, UserState>(
        (ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<UserState> {
  final AutoDisposeStateNotifierProviderRef ref;
  UserNotifier(this.ref) : super(UserState.initial());

  final _box = Hive.box(kUser);

  Future<void> sendEmailVerificationLink() async {
    final user = ref.read(userDetailsProvider);
    Future<void> callback() async {
      await ref
          .read(userRepositoryProvider)
          .sendVerificationLink(user.email, kDefaultPassword);
    }

    state = const UserState.loading('Sending email verification link ...');
    try {
      await ref
          .read(userRepositoryProvider)
          .createFirebaseUser(user.email, kDefaultPassword);
      await callback();
      state = const UserState.done();
    } catch (error) {
      //if a user is already created, this error will show-up. It may happen if
      //the user performs an action to send verification email to the same email
      if (error is FirebaseAuthException &&
          error.code == 'email-already-in-use') {
        await callback().catchError((error) => _handleError(error));
        return;
      }
      _handleError(error);
    }
  }

  Future<void> checkIfEmailIsVerified() async {
    state = const UserState.loading('Checking if email is verified ...');
    final user = ref.read(userDetailsProvider);
    try {
      final userCredential = await ref
          .read(userRepositoryProvider)
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
    state = const UserState.loading();
    User? user;
    try {
      if (signupOption == SigningUpOptions.google) {
        user = await ref
            .read(userRepositoryProvider)
            .getUserGoogleAccountDetails();
      } else if (signupOption == SigningUpOptions.facebook) {
        user = await ref
            .read(userRepositoryProvider)
            .getUserFacebookAccountDetails();
      }
      if (user == null) {
        state = const UserState.content();
      } else {
        ref.read(userDetailsProvider.notifier).state = user;
        state = const UserState.done();
      }
    } catch (error) {
      _handleError(error);
    }
  }

  Future<void> signUp() async {
    state = const UserState.loading('Creating your account ...');
    final user = ref.read(userDetailsProvider);
    final password = ref.read(passwordProvider);
    Future<void> callback() async {
      final body = Map<String, String>.from(user.toJson())
        ..addAll({"password": password});
      await ref.read(userRepositoryProvider).createUserInDatabase(body);
      ref.read(signedInUserProvider.notifier).state = user;
      final _ = ref.refresh(userDetailsProvider);
      state = const UserState.done();
    }

    try {
      if (user.isSignedUpWithEmailAndPassword) {
        //Reaching this stage means user is verified. Hence changing the
        //user details in firebase to match the given password instead of the default
        final userCredential = await ref
            .read(userRepositoryProvider)
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
    final user = ref.read(userDetailsProvider);
    final password = ref.read(passwordProvider);
    try {
      final userData = await ref
          .read(userRepositoryProvider)
          .signInUserInDatabase(user.email, password);

      final shouldRemember = ref.read(rememberMeValueProvider);
      if (shouldRemember) {
        await _box.put(kUser, json.encode(userData));
      }
      ref.read(signedInUserProvider.notifier).state = userData;
      final _ = ref.refresh(userDetailsProvider);
      state = const UserState.done();
    } catch (error) {
      _handleError(error);
    }
  }

  void autoLogIn() {
    state = const UserState.loading();
    final jsonUser = _box.get(kUser) as String?;
    if (jsonUser == null) {
      state = const UserState.failed('No user data found');
      return;
    }
    final decoded = json.decode(jsonUser);
    ref.read(signedInUserProvider.notifier).state = User.fromJson(decoded);
    state = const UserState.done();
  }

  Future<void> signOut() async {
    state = const UserState.loading();
    //if no user was saved because user just signed up, and not logged in catch
    //any exceptions when deleting
    await _box.delete(kUser).catchError((_) {});
    _disposeSignedInUserData();
    state = const UserState.done();
  }

  Future<void> deleteAccount() async {
    state = const UserState.loading();
    final user = ref.read(userDetailsProvider);
    final password = ref.read(passwordProvider);
    await ref
        .read(userRepositoryProvider)
        .deleteUser(user.email, password)
        .catchError((error) => _handleError(error));
    await _box.delete(kUser).catchError((_) {});
    _disposeSignedInUserData();
    state = const UserState.done();
  }

  _disposeSignedInUserData() {
    final _ = ref.refresh(passwordProvider);
    final p = ref.refresh(signedInUserProvider);
    debugPrint("$p");
  }

  _handleError(var error) {
    final message = getErrorMessage(error);
    state = UserState.failed(message);
  }
}
