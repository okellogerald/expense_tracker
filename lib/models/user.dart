// ignore_for_file: constant_identifier_names, invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User(
      {@JsonKey(name: 'display_name')
      @Default('')
          String displayName,
      @Default('')
          String email,
      @JsonKey(name: 'signup_option')
      @Default(SigningUpOptions.email_password)
          String signUpOption,
      @JsonKey(name: 'photo_url')
      @Default('')
          String photoUrl,
      @JsonKey(name: 'backup_option')
      @Default(BackUpOptions.on_button_tap)
          String backUpOption,
      @JsonKey(name: 'currency')
      @Default(0)
          int currencyCodePoint}) = _User;

  bool get isSignedUpWithEmailAndPassword =>
      signUpOption == SigningUpOptions.email_password;

  bool get isSignedUpWithGoogle => signUpOption == SigningUpOptions.google;

  bool get isSignedUpWithFacebook => signUpOption == SigningUpOptions.facebook;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromGoogleAccount(GoogleSignInAccount account) => User(
      signUpOption: SigningUpOptions.google,
      displayName: account.displayName ?? '',
      email: account.email,
      photoUrl: account.photoUrl ?? '');

  factory User.fromFacebookProfile(Map<String, dynamic> account) => User(
      signUpOption: SigningUpOptions.facebook,
      displayName: account['name'] ?? '',
      email: account['email'],
      photoUrl: account['picture']['data']['url'] ?? '');
}

class SigningUpOptions {
  static const email_password = 'Email_Password';
  static const google = 'Google';
  static const facebook = 'Facebook';
}

class BackUpOptions {
  static const never = "Never";
  static const daily = 'Daily';
  static const weekly = 'Weekly';
  static const end_of_the_month = 'End of Month';
  static const on_button_tap = 'On Button Tap';
}
