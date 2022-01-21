class DatabaseError {
  DatabaseError._(this.message);

  final String message;

  factory DatabaseError.specific(String error) => DatabaseError._(error);

  factory DatabaseError.internet() => DatabaseError._(
      'It seems there is no internet connnection. This operation requires internet to function.');

  factory DatabaseError.unknown() =>
      DatabaseError._('Unknown error happened, please try again.');

  factory DatabaseError.emailAvailable() => DatabaseError._(
      'This email has already been used. If it is yours try signing in.');

  factory DatabaseError.signedByGoogleNotEmailPassword() => DatabaseError._(
      'This email was used when signing up with Google. Try signing in with Google again. Or rather create an account with email and password.');

  factory DatabaseError.signedByFacebookNotEmailPassword() => DatabaseError._(
      'This email was used when signing up with Facebook. Try signing in with Facebook again. Or rather create an account with email and password.');
}
