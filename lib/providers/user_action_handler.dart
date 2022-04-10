import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/validation_logic.dart';
import 'pages_provider.dart';
import 'user_details_provider.dart';
import 'user_notifier.dart';

enum UserAction { logIn, signUp, verifyEmail, sendVerificationLink }

extension UserActionExtension on UserAction {
  bool get needsValidation => this != UserAction.verifyEmail;
  bool get isVerifyingEmail => this == UserAction.verifyEmail;
  bool get isLoggingIn => this == UserAction.logIn;
  bool get isSigningUp => this == UserAction.signUp;
  bool get isSendingVerificationLink => this == UserAction.sendVerificationLink;
}

///checks if there is a need to validate something before performing the action.
///e.g when logging in, we need to check if the email is valid before sending
///the request.
void handleUserAction(WidgetRef ref, UserAction userAction) async {
  final userNotifier = ref.read(userNotifierProvider.notifier);

  if (userAction.needsValidation) {
    final errors = <String, String?>{};
    final user = ref.read(userDetailsProvider);
    final password = ref.read(passwordProvider);

    switch (userAction) {
      case UserAction.sendVerificationLink:
        errors['email'] = validateEmail(user.email);
        break;
      case UserAction.signUp:
        errors['password'] = validatePassword(password);
        errors['username'] = validateText(user.displayName, 'Username');
        errors['currency'] = validateText(user.currency, 'currency');
        break;
      case UserAction.logIn:
        errors['email'] = validateEmail(user.email);
        errors['password'] = validatePassword(password);
        break;
      case UserAction.verifyEmail:
        break;
    }

    ref.read(userValidationErrorsProvider.state).state = errors;

    final hasErrors = checkErrors(errors);
    if (!hasErrors) {
      if (userAction.isLoggingIn) await userNotifier.logIn();
      if (userAction.isSigningUp) await userNotifier.signUp();
      if (userAction.isSendingVerificationLink) {
        await userNotifier.sendEmailVerificationLink();
      }
    }
    return;
  }
  //user-action needs no validation
  if (userAction.isVerifyingEmail) await userNotifier.checkIfEmailIsVerified();
}

///updating the page so that ref listening works properly i.e does not call
///other pages for an action done on another page.
Future<bool> handleStateOnPop(WidgetRef ref, Pages toPage) async {
  ref.read(pagesProvider.state).state = toPage;
  return true;
}

///updates the current page to pages provider
void handleStateOnInit(WidgetRef ref, Pages currentPage) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    ref.read(pagesProvider.state).state = currentPage;
  });
}
