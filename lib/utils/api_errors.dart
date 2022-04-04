class ApiErrors {
  ApiErrors(this.message);

  final String message;

  factory ApiErrors.specific(String error) => ApiErrors(error);

  ///Errors concerning the device internet connection
  factory ApiErrors.internet() => ApiErrors(
      'It seems there is no internet connection. This operation requires internet to function.');

  ///Unknown error. Not anticipated by the pre-determined possible errors.
  factory ApiErrors.unknown() =>
      ApiErrors('Unknown error happened, please try again.');

  factory ApiErrors.failedToCheckEmailVerificationStatus() => ApiErrors(
      'Sorry, an unknown error happened. We recommend you re-enter your email address and get it verified');

  factory ApiErrors.emailNotVerified(String email) =>
      ApiErrors('Email $email is not yet verified');

  ///No registered user corresponds to the information entered during sign-in.
  ///Maybe the credentials entered are wrongly typed or the user has not sign-up.
  factory ApiErrors.invalidDetails() =>
      ApiErrors('Invalid email address or password');

  ///The email used for signing-up is already used by other user.
  factory ApiErrors.emailAvailable() => ApiErrors(
      'This email has already been used. If it is yours try signing in.');

  ///The email used for signing-up is already used by other user.
  factory ApiErrors.emailInUse(String signingMethod) => ApiErrors(
      'This email has already been used. Try signing in with the method you signed in with at first, $signingMethod');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory ApiErrors.signedByGoogleNotEmailPassword() => ApiErrors(
      'This email was used when signing up with Google. Try signing in with Google again. Or rather delete this account first.');

  ///The email used for signing-in has not been registered by email-password. Hence
  ///putting the password of his/her gmail account won't work, since for all
  ///users logged in with social platforms, the password is empty.
  factory ApiErrors.signedByFacebookNotEmailPassword() => ApiErrors(
      'This email was used when signing up with Facebook. Try signing in with Facebook again. Or rather delete this account first.');

  @override
  String toString() => message;
}
