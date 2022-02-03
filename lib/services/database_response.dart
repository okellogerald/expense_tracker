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

  ///Unknown error. Not anticipated by the pre-determined possible errors.
  factory DatabaseError.postgrestError() => DatabaseError._(
      'An error happened when communicating with the database. Please try again later.');

  ///No registered user corresponds to the information entered during sign-in.
  ///Maybe the credentials entered are wrongly typed or the user has not sign-up.
  factory DatabaseError.invalidDetails() =>
      DatabaseError._('Invalid email address or password');

  ///The email used for signing-up is already used by other user.
  factory DatabaseError.emailAvailable() => DatabaseError._(
      'This email has already been used. If it is yours try signing in.');

  ///The email used for signing-up is already used by other user.
  factory DatabaseError.emailInUse(String signingMethod) => DatabaseError._(
      'This email has already been used. Try signing in with the method you signed in with at first, $signingMethod');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory DatabaseError.signedByGoogleNotEmailPassword() => DatabaseError._(
      'This email was used when signing up with Google. Try signing in with Google again. Or rather delete this account first.');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory DatabaseError.signedByFacebookNotEmailPassword() => DatabaseError._(
      'This email was used when signing up with Facebook. Try signing in with Facebook again. Or rather delete this account first.');

  @override
  String toString() {
    return message;
  }
}
