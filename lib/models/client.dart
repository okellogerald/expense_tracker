import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

part 'client.g.dart';

@HiveType(typeId: 6)
class Client extends HiveObject {
  @HiveField(0)
  final String displayName;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String photoUrl;

  Client({
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  factory Client.empty() => Client(
        displayName: '',
        email: '',
        photoUrl: '',
      );

  static Client fromGoogleAccount(GoogleSignInAccount account) => Client(
        displayName: account.displayName!,
        email: account.email,
        photoUrl: account.photoUrl ??
            'https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-128.png',
      );

  static Client fromFacebookProfile(Map<String, dynamic> account) => Client(
        displayName: account['name'],
        email: account['email'],
        photoUrl: account['picture']['data']['url'] ??
            'https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-128.png',
      );
}
