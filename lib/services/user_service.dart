import 'dart:convert';
import 'package:budgetting_app/source.dart' hide Provider;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:supabase/supabase.dart' hide User;
import 'package:http/http.dart' as http;

class UserService {
  UserService(this.client);

  final SupabaseClient client;

  final _box = Hive.box(kClient);
  final google = GoogleSignIn();
  final facebook = FacebookAuth.instance;

  Client get getClient => _box.get(kClient) as Client;
  bool get isLoggedIn => _box.isNotEmpty;

  Future<Client?> logInWithFacebook() async {
    final result = await facebook.login();

    if (result.accessToken != null) {
      final url =
          'https://graph.facebook.com/v2.12/me?fields=name,picture.height(200),email&access_token=${result.accessToken!.token}';

      var response = await http.get(Uri.parse(url));
      var profile = json.decode(response.body);
      final user = Client.fromFacebookProfile(profile);
      await client.auth.signUp(user.email, '');
      _box.put(kClient, user);
      return user;
    }
    //else returns null
  }

  Future<Client?> signUpWithGoogle() async {
    google.disconnect();

    final account = await google.signIn();
    if (account != null) {
      final user = Client.fromGoogleAccount(account);
      await client.auth.signUp(user.email, '');
      _box.put(kClient, user);
      return user;
    }
    //else returns null
  }

  Future<Client?> logInWithGoogle() async {
    google.disconnect();

    final account = await google.signIn();
    if (account != null) {
      final user = Client.fromGoogleAccount(account);
      await client.auth.signIn(provider: Provider.google);
      _box.put(kClient, user);
      return user;
    }
    //else returns null
  }
}
