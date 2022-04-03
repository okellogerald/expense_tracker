class ApiError {
  ApiError(this.message);

  final String message;

  factory ApiError.specific(String error) => ApiError(error);

  ///Errors concerning the internet connection of the device
  factory ApiError.internet() => ApiError(
      'It seems there is no internet connnection. This operation requires internet to function.');

  ///Unknown error. Not anticipated by the pre-determined possible errors.
  factory ApiError.unknown() =>
      ApiError('Unknown error happened, please try again.');

  ///Unknown error. Not anticipated by the pre-determined possible errors.
  factory ApiError.postgrestError() => ApiError(
      'An error happened when communicating with the database. Please try again later.');

  ///No registered user corresponds to the information entered during sign-in.
  ///Maybe the credentials entered are wrongly typed or the user has not sign-up.
  factory ApiError.invalidDetails() =>
      ApiError('Invalid email address or password');

  ///The email used for signing-up is already used by other user.
  factory ApiError.emailAvailable() => ApiError(
      'This email has already been used. If it is yours try signing in.');

  ///The email used for signing-up is already used by other user.
  factory ApiError.emailInUse(String signingMethod) => ApiError(
      'This email has already been used. Try signing in with the method you signed in with at first, $signingMethod');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory ApiError.signedByGoogleNotEmailPassword() => ApiError(
      'This email was used when signing up with Google. Try signing in with Google again. Or rather delete this account first.');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory ApiError.signedByFacebookNotEmailPassword() => ApiError(
      'This email was used when signing up with Facebook. Try signing in with Facebook again. Or rather delete this account first.');

  @override
  String toString() {
    return message;
  }
}
