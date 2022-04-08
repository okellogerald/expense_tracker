import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/providers/user_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:hive/hive.dart';
import '../constants.dart';
import '../errors/exception_handler.dart';
import '../errors/user_exception.dart';
import '../models/user.dart';
import '../pages/pages_source.dart';
import '../states/user_state.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref.read));

class UserNotifier extends StateNotifier<UserState> {
  final Reader read;
  UserNotifier(this.read) : super(UserState.initial());

  Future<void> sendEmailVerificationLink() async {
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);

    //checks validation errors
    final errors = read(userDetailsValidationErrorsProvider(
        Pages.email_password_registration_page));
    if (errors.isNotEmpty) return;

    state = const UserState.loading();
    try {
      await read(userRepositoryProvider)
          .createFirebaseUser(user.email, password);
      await read(userRepositoryProvider)
          .sendVerificationLink(user.email, password);
      state = const UserState.done();
    } on FirebaseAuthException catch (e) {
      //if sendingEmailVerification was somehow not successful but creating user
      //operation was, calling this function second time will show this error.
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

  Future<void> checkIfEmailIsVerified() async {
    state = const UserState.loading();
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
    try {
      final userCredential = await read(userRepositoryProvider)
          .signInFirebaseUser(user.email, password);
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
    if (signupOption == SigningUpOptions.google) {
      user = await read(userRepositoryProvider).getUserGoogleAccountDetails();
    } else if (signupOption == SigningUpOptions.facebook) {
      user = await read(userRepositoryProvider).getUserFacebookAccountDetails();
    }
    if (user == null) {
      state = const UserState.content();
    } else {
      read(userDetailsProvider.state).state = user;
    }
  }

  Future<void> signUp() async {
    //checks validation errors
    final errors = read(userDetailsValidationErrorsProvider(
        Pages.email_password_registration_page));
    if (errors.isNotEmpty) return;

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
    //checks validation errors
    final errors = read(userDetailsValidationErrorsProvider(Pages.login_page));
    if (errors.isNotEmpty) return;

    state = const UserState.loading();
    final user = read(userDetailsProvider);
    final password = read(passwordProvider);
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

  ///stores user details
  void updateUserDetails(
      {String? email,
      String? currency,
      String? displayName,
      String? photoUrl,
      String? signupOption}) {
    state = const UserState.loading();
    final user = read(userDetailsProvider);
    final updatedUser = user.copyWith(
        email: email ?? user.email,
        currency: currency ?? user.currency,
        displayName: displayName ?? user.displayName,
        photoUrl: photoUrl ?? user.photoUrl,
        signUpOption: signupOption ?? user.signUpOption);
    read(userDetailsProvider.state).state = updatedUser;
    state = const UserState.content();
  }

  _handleError(var error) {
    final message = getErrorMessage(error);
    state = UserState.failed(message: message);
  }
}
