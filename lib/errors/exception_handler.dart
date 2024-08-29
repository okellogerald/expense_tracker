import 'dart:async';
import 'dart:io';
import 'api_error.dart';
import 'common_exception.dart';
import 'user_exception.dart';

String getErrorMessage(var error) {
  if (error is SocketException) return CommonExceptionKeys.noInternet;
  if (error is TimeoutException) return CommonExceptionKeys.timeout;
  if (error is ApiError) return error.message;
  if (error is UserException) return error.message;
  return CommonExceptionKeys.unknown;
}
