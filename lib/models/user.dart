import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

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

  User({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.currencyCodePoint,
  });

  factory User.empty() => User(
        displayName: '',
        email: '',
        photoUrl: '',
        currencyCodePoint: 0,
      );

  User copyWith(
      {required String email, String? photoUrl, String? name, int? currency}) {
    return User(
      displayName: name ?? displayName,
      email: email,
      photoUrl: photoUrl ?? this.photoUrl,
      currencyCodePoint: currency ?? currencyCodePoint,
    );
  }

  static User fromGoogleAccount(GoogleSignInAccount account,
          {int currency = 0}) =>
      User(
        displayName: account.displayName!,
        email: account.email,
        photoUrl: account.photoUrl ??
            'https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-128.png',
        currencyCodePoint: currency,
      );

  static User fromFacebookProfile(Map<String, dynamic> account,
          {int currency = 0}) =>
      User(
        displayName: account['name'],
        email: account['email'],
        photoUrl: account['picture']['data']['url'] ??
            'https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-128.png',
        currencyCodePoint: currency,
      );
}
