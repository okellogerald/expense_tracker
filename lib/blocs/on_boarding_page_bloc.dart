import '../source.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  void signupWithGoogle() async => await _onboard(true, Providers.google);

  void loginWithGoogle() async => await _onboard(false, Providers.google);

  void signupWithFacebook() async => await _onboard(true, Providers.facebook);

  void loginWithFacebook() async => await _onboard(false, Providers.facebook);

  void init({User? user}) {
    if (user == null) return;
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    supp = supp.copyWith(user: user);
    emit(OnBoardingPageState.content(supp));
  }

  void updateEmail(String email) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final user = supp.user.copyWith(email: email);
    supp = supp.copyWith(user: user);
    emit(OnBoardingPageState.content(supp));
  }

  void updatePassword(String password) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    supp = supp.copyWith(password: password);
    emit(OnBoardingPageState.content(supp));
  }

  void loginWithEmailPassword() async => await _onboardWithEmailPassword(false);

  void signupWithEmailPassword() async => await _onboardWithEmailPassword(true);

  void sendOTP() => _onboardWithEmailPassword(false, isVerifying: true);

  void verify() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    try {
      final user =
          await service.verifyEmail(supp.user.email, supp.password, supp.otp);
      if (user == null) {
        emit(OnBoardingPageState.failed(supp, 'Invalid code!'));
        return;
      }
      emit(OnBoardingPageState.success(supp));
    } on DatabaseError catch (_) {
      emit(OnBoardingPageState.failed(supp, _.message));
      return;
    }
  }

  void updateUser() async {
    log('in here');
    var supp = state.supplements.copyWith(errors: {});
    emit(OnBoardingPageState.laoding(supp));

    _validateName();
    if (supp.errors.isNotEmpty) return;

    emit(OnBoardingPageState.laoding(supp));

    try {
      final user = await service.updateUser(
          email: supp.user.email,
          name: supp.user.displayName,
          currency: supp.currency);
      if (user == null) {
        log('is null the user from updating user function');
        emit(OnBoardingPageState.failed(supp, 'Invalid code!'));
        return;
      }
      emit(OnBoardingPageState.success(supp));
    } on DatabaseError catch (_) {
      emit(OnBoardingPageState.failed(supp, _.message));
      return;
    }
  }

  void updateOtp(int id, int current) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final otp = service.updateOTP(supp.otp, id, current);
    emit(OnBoardingPageState.content(supp.copyWith(otp: otp)));
  }

  Future<void> _onboardWithEmailPassword(bool isSigningUp,
      {bool isVerifying = false}) async {
    //clear errors.
    var supp = state.supplements.copyWith(errors: {});
    emit(OnBoardingPageState.laoding(supp));

    _validate();
    if (supp.errors.isNotEmpty) return;

    emit(OnBoardingPageState.laoding(supp));

    if (isVerifying) {
      try {
        await service.checkIfRegisteredWithSocial(supp.user.email);
        await service.sendOTP(supp.user.email);
        emit(OnBoardingPageState.success(supp));
      } on DatabaseError catch (_) {
        emit(OnBoardingPageState.failed(supp, _.message));
      }
    } else {
      await _onboard(isSigningUp, Providers.email_password);
    }
  }

  void _validate() {
    var supp = state.supplements;
    final email = supp.user.email.trim();
    final password = supp.password.trim();

    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+");
    final isValidEmail = regex.hasMatch(email);

    if (!isValidEmail) {
      supp.errors['email'] = 'Wrong email address.';
    }
    if (email.isEmpty) {
      supp.errors['email'] = 'Email address is required';
    }
    if (password.isEmpty) {
      supp.errors['password'] = 'Password is required';
    }

    emit(OnBoardingPageState.content(supp));
  }

  void _validateName() {
    var supp = state.supplements;
    final name = supp.user.displayName.trim();

    if (name.isEmpty) {
      supp.errors['name'] = 'Username can\'t be empty';
    }

    log(name.isEmpty.toString());

    emit(OnBoardingPageState.content(supp));
  }

  Future<void> _onboard(bool isSigningUp, String provider) async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));

    User? user;

    final email = supp.user.email;
    final password = supp.password;

    try {
      switch (provider) {
        case Providers.email_password:
          if (isSigningUp) {
            user = await service.signUpWithEmailPassword(email, password);
          } else {
            user = await service.loginWithEmailPassword(email, password);
          }
          break;
        case Providers.google:
          if (isSigningUp) user = await service.signUpWithGoogle();
          if (!isSigningUp) user = await service.logInWithGoogle();
          break;
        case Providers.facebook:
          if (isSigningUp) user = await service.signUpWithFacebook();
          if (!isSigningUp) user = await service.logInWithFacebook();
          break;
        default:
      }

      if (user == null) {
        emit(OnBoardingPageState.content(supp));
        return;
      }

      log('user is not null');

      supp = supp.copyWith(user: user);
      emit(OnBoardingPageState.success(supp));
    } on DatabaseError catch (_) {
      emit(OnBoardingPageState.failed(supp, _.message));
    }
  }

  void updateCodePoint(int codePoint) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    supp = supp.copyWith(currency: codePoint);
    emit(OnBoardingPageState.content(supp));
  }
}
