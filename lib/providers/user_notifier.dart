import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState.initial());

  final _firebaseAuth = FirebaseAuth.instance;

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
}
