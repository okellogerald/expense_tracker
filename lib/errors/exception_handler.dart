import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'common_exception.dart';
import 'user_exception.dart';

class AppError {
  final String message;
  AppError(this.message);

  @override
  String toString() => 'ERROR: $message';
}

handleError(var error) {
  if (error is SocketException) throw AppError(CommonExceptionKeys.noInternet);
  if (error is TimeoutException) throw AppError(CommonExceptionKeys.timeout);
  if (error is UserException) throw AppError(error.message);
  if (error is FirebaseAuthException) {
    throw AppError(error.message ?? error.code);
  }

  throw AppError(CommonExceptionKeys.unknown);
}

String getErrorMessage(var error, [bool isVerifyingEmail = false]) {
  if (error is SocketException) return CommonExceptionKeys.noInternet;
  if (error is TimeoutException) return CommonExceptionKeys.timeout;
  if (error is UserException) return error.message;
  if (error is FirebaseAuthException) {
    final code = error.code;
    if ((code == 'invalid-email' ||
            code == 'user-disabled' ||
            code == 'user-not-found') &&
        isVerifyingEmail) {
      return UserException.failedToCheckEmailVerificationStatus().message;
    }
    return error.message ?? error.code;
  }
  return CommonExceptionKeys.unknown;
}
