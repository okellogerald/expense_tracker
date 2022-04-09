// ignore_for_file: constant_identifier_names
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Pages {
  login_page,
  signup_page,
  email_password_registration_page,
  additional_info_page,
  verification_page
}

final pagesProvider = StateProvider<Pages>((ref) => Pages.login_page);
