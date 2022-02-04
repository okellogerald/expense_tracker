// ignore_for_file: constant_identifier_names

import 'package:budgetting_app/source.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

class BackUpOptions {
  static const never = "Never";
  static const daily = 'Daily';
  static const weekly = 'Weekly';
  static const end_of_the_month = 'End of Month';
  static const on_button_tap = 'On Button Tap';
}

@HiveType(typeId: 6)
class User extends HiveObject {
  @HiveField(0)
  final String displayName;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String photoUrl;

  @HiveField(3)
  final int currencyCodePoint;

  @HiveField(4)
  final String backUpOption;

  User({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.currencyCodePoint,
    this.backUpOption = BackUpOptions.daily,
  });

  bool get isProfileComplete => currencyCodePoint != 0;

  factory User.empty() => User(
        displayName: '',
        email: '',
        photoUrl: '',
        currencyCodePoint: 0,
      );

  User copyWith(
      {String? email,
      String? photoUrl,
      String? name,
      int? currency,
      String? backUpOption}) {
    return User(
      displayName: name ?? displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      currencyCodePoint: currency ?? currencyCodePoint,
      backUpOption: backUpOption ?? this.backUpOption,
    );
  }

  static User fromGoogleAccount(GoogleSignInAccount account,
          {int currency = 0}) =>
      User(
        displayName: account.displayName!,
        email: account.email,
        photoUrl: account.photoUrl ?? kDefaultPhotoUrl,
        currencyCodePoint: currency,
      );

  static User fromFacebookProfile(Map<String, dynamic> account,
          {int currency = 0}) =>
      User(
        displayName: account['name'],
        email: account['email'],
        photoUrl: account['picture']['data']['url'] ?? kDefaultPhotoUrl,
        currencyCodePoint: currency,
      );

  static User fromDatabase(Map<String, dynamic> json) {
    log(json['currency']);
    return User(
      displayName: json['display_name'] ?? '',
      email: json['email'],
      photoUrl: json['photo_url'] ?? '',
      currencyCodePoint: int.parse(json['currency'] ?? 0),
      backUpOption: json['backUpOption'] ?? BackUpOptions.daily,
    );
  }

  @override
  String toString() {
    return 'User(email: $email, displayName: $displayName, photoUrl: $photoUrl, currency: $currencyCodePoint, backUpOption: $backUpOption)';
  }
}
