import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

const user = User(
  displayName: "Okello Gerald",
  email: "okello@example.com",
  currency: "TZS",
);

//used to decide the homepage, and stores only verified user credentials
final signedInUserProvider = StateProvider<User>((ref) => user);
