class UserException {
  final String message;
  UserException._(this.message);

  ///No registered user corresponds to the information entered during sign-in.
  ///Maybe the credentials entered are wrongly typed or the user has not sign-up.
  factory UserException.invalidDetails() =>
      UserException._('Invalid email address or password');

  ///The email used for signing-up is already used by other user.
  factory UserException.emailInUse() => UserException._(
      'This email has already been used. If it is yours try signing in.');

  ///The email used for signing-up is already used by other user.
  factory UserException.emailNotVerified(String email) =>
      UserException._('Email $email is not yet verified');

  ///Happens if we fail to get the user instance when signing in to send verification
  ///link to user's email. SHOULD BE NEARLY IMPOSSIBLE TO HAPPEN, JUST HEAR FOR TESTING.
  factory UserException.failedToCheckEmailVerificationStatus() => UserException._(
      'Sorry, we failed to check your email verification status. Please re-enter you email and get it verified');
}
