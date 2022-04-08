import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../constants.dart';
import '../models/user.dart';

final _box = Hive.box(kUser);

final userDetailsProvider = StateProvider<User>((ref) => const User());

final passwordProvider =
    StateProvider<String>((ref) => 'default_password@expense_tracker');

final signedInUserProvider = Provider<User?>((ref) {
  final jsonUser = _box.get(kUser) as String?;
  if (jsonUser == null) return null;
  return User.fromJson(json.decode(jsonUser));
});
