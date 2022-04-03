// ignore_for_file: constant_identifier_names, invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable()
class User with _$User {
  const User._();

  const factory User(
      {@JsonKey(name: 'display_name') @Default('') String displayName,
      @Default('') String email,
      @JsonKey(name: 'signup_option') @Default('') String signUpOption,
      @JsonKey(name: 'photo_url') @Default('') String photoUrl,
      @JsonKey(name: 'backup_option') @Default('') String backUpOption,
      @JsonKey(name: 'currency') @Default(0) int currencyCodePoint}) = _User;

  bool get isProfileComplete => currencyCodePoint != 0;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromGoogleAccount(GoogleSignInAccount account) => User(
      displayName: account.displayName!,
      email: account.email,
      photoUrl: account.photoUrl ?? '');

  factory User.fromFacebookProfile(Map<String, dynamic> account) => User(
      displayName: account['name'],
      email: account['email'],
      photoUrl: account['picture']['data']['url'] ?? '');
}

class SigningUpOptions {
  static const email_password = 'Email & Password';
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
