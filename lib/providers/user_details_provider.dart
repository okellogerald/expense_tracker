import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

//used for storing user values when performing onboarding processes
final userDetailsProvider = StateProvider<User>((ref) => const User());

//should not be refreshed after the user logs-in or signs-up as it may be
//used when deleting user firebase account, which will require re-signing in
//the user programmatically.
final passwordProvider = StateProvider<String>((ref) => '');

final rememberMeValueProvider = StateProvider<bool>((ref) => false);

final userValidationErrorsProvider =
    StateProvider.autoDispose<Map<String, String?>>((ref) => {});

//used to decide the homepage, and stores only verified user credentials
final signedInUserProvider = StateProvider<User?>((ref) => null);

///stores user details in the user details provider
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
