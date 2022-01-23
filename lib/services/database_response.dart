class DatabaseError {
  DatabaseError._(this.message);

  final String message;

  factory DatabaseError.specific(String error) => DatabaseError._(error);

  ///Errors concerning the internet connection of the device
  factory DatabaseError.internet() => DatabaseError._(
      'It seems there is no internet connnection. This operation requires internet to function.');

  ///Unknown error. Not anticipated by the pre-determined possible errors.
  factory DatabaseError.unknown() =>
      DatabaseError._('Unknown error happened, please try again.');

  ///No registered user corresponds to the information entered during sign-in.
  ///Maybe the credentials entered are wrongly typed or the user has not sign-up.
  factory DatabaseError.invalidDetails() =>
      DatabaseError._('Invalid email address or password');

  ///The email used for signing-up is already used by other user.
  factory DatabaseError.emailAvailable() => DatabaseError._(
      'This email has already been used. If it is yours try signing in.');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory DatabaseError.signedByGoogleNotEmailPassword() => DatabaseError._(
      'This email was used when signing up with Google. Try signing in with Google again. Or rather create an account with email and password.');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory DatabaseError.signedByFacebookNotEmailPassword() => DatabaseError._(
      'This email was used when signing up with Facebook. Try signing in with Facebook again. Or rather create an account with email and password.');
}
