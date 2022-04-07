import 'dart:async';
import 'dart:io';

import 'user_exception.dart';

handleError(var error, [bool isVerifyingEmail = false]) {
  if (error is SocketException) throw UserException.internet();
  if (error is TimeoutException) throw UserException.timeOut();
  if (error is UserException) throw error;
  throw Exception(unKnown);
}
