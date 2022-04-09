import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../models/user.dart';

final _box = Hive.box(kUser);

final userDetailsProvider = StateProvider<User>((ref) => const User());

final passwordProvider = StateProvider<String>((ref) => '');

final userValidationErrorsProvider =
    StateProvider<Map<String, String?>>((ref) => {});

final signedInUserProvider = Provider<User?>((ref) {
  final jsonUser = _box.get(kUser) as String?;
  if (jsonUser == null) return null;
  return User.fromJson(json.decode(jsonUser));
});

///stores user details
void updateUserDetails(WidgetRef ref,
    {String? email,
    String? currency,
    String? displayName,
    String? photoUrl,
    String? signupOption}) {
  final user = ref.read(userDetailsProvider);
  final updatedUser = user.copyWith(
      email: email ?? user.email,
      currency: currency ?? user.currency,
      displayName: displayName ?? user.displayName,
      photoUrl: photoUrl ?? user.photoUrl,
      signUpOption: signupOption ?? user.signUpOption);
  ref.read(userDetailsProvider.state).state = updatedUser;
}
