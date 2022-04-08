import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../constants.dart';
import '../models/user.dart';
import '../pages/pages_source.dart';
import '../utils/validation_logic.dart';

final _box = Hive.box(kUser);

final userDetailsProvider = StateProvider<User>((ref) => const User());

final passwordProvider =
    StateProvider<String>((ref) => 'default_password@expense_tracker');

final signedInUserProvider = Provider<User?>((ref) {
  final jsonUser = _box.get(kUser) as String?;
  if (jsonUser == null) return null;
  return User.fromJson(json.decode(jsonUser));
});

final userDetailsValidationErrorsProvider =
    Provider.family<Map<String, String?>, Pages>((ref, page) {
  final errors = <String, String?>{};
  final user = ref.read(userDetailsProvider);
  final password = ref.read(passwordProvider);

  switch (page) {
    case Pages.email_password_registration_page:
      errors['email'] = validateEmail(user.email);
      break;
    case Pages.additional_info_page:
      errors['password'] = validatePassword(password);
      errors['username'] = validateText(user.displayName, 'Username');
      errors['currency'] = validateText(user.currency, 'currency');
      break;
    case Pages.login_page:
      errors['email'] = validateEmail(user.email);
      errors['password'] = validatePassword(password);
      break;
    case Pages.verification_page:
      break;
  }
  return errors;
});
