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

  void updateEmail(String email) => updateUserDetails(email: email);

  void updateName(String name) => updateUserDetails(name: name);

  void updateUserDetails({String? name, String? email}) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final user = supp.user.copyWith(name: name, email: email);
    supp = supp.copyWith(user: user);
    emit(OnBoardingPageState.content(supp));
  }

  void updatePassword(String password) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    supp = supp.copyWith(password: password);
    emit(OnBoardingPageState.content(supp));
  }

  void updateBackUpOption(String selectedOption) async {
    var supp = state.supplements;
    var user = supp.user;

    if (selectedOption == user.backUpOption) return;

    emit(OnBoardingPageState.laoding(supp));
    try {
      final _user = await service.updateUser(
          email: user.email,
          name: user.displayName,
          currency: user.currencyCodePoint,
          backUpOption: selectedOption);

      if (_user == null) throw DatabaseError.unknown();

      supp = supp.copyWith(user: _user);
      emit(OnBoardingPageState.content(supp));
    } on DatabaseError catch (_) {
      emit(OnBoardingPageState.failed(supp, _.message));
      return;
    }
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
      supp.errors['username'] = 'Username can\'t be empty';
    }
    if (supp.currency == 0) {
      supp.errors['currency'] = 'Currency is not selected';
    }

    log(supp.errors.toString());

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
