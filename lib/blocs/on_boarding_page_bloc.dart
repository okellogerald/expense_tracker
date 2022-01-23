import '../source.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  void showValues() {
    log(state.supplements.client.email);
  }

  void signupWithGoogle() async => await _onboard(true, Providers.google);

  void loginWithGoogle() async => await _onboard(false, Providers.google);

  void signupWithFacebook() async => await _onboard(true, Providers.facebook);

  void loginWithFacebook() async => await _onboard(false, Providers.facebook);

  void updateEmail(String email) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final client = supp.client.copyWith(email: email);
    supp = supp.copyWith(client: client);
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

  void saveDataForVerification() =>
      _onboardWithEmailPassword(false, isSavingForVerification: true);

  void verify() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    try {
      final isVerified = await service.verifyEmail(supp.otp);
      if (!isVerified) {
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
    final otp = service.updateOTP(supp.otp,id, current);
    emit(OnBoardingPageState.content(supp.copyWith(otp: otp)));
  }

  Future<void> _onboardWithEmailPassword(bool isSigningUp,
      {bool isSavingForVerification = false}) async {
    //clear errors.
    var supp = state.supplements.copyWith(errors: {});
    emit(OnBoardingPageState.laoding(supp));

    _validate();
    if (supp.errors.isNotEmpty) return;

    emit(OnBoardingPageState.laoding(supp));

    if (isSavingForVerification) {
      service.saveDataForVerification(supp.client.email, supp.password);
      await service.sendOTP();
    } else {
      await _onboard(isSigningUp, Providers.email_password);
    }
    emit(OnBoardingPageState.success(supp));
  }

  void _validate() {
    var supp = state.supplements;
    final email = supp.client.email.trim();
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

  Future<void> _onboard(bool isSigningUp, String provider) async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));

    User? user;

    final email = supp.client.email;
    final password = supp.password;

    try {
      switch (provider) {
        case Providers.email_password:
          if (isSigningUp) {
            user = await service.signUpWithEmailPassword();
          } else {
            user = await service.logInWithEmailPassword(email, password);
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
      supp = supp.copyWith(client: user);
      emit(OnBoardingPageState.success(supp));
    } on DatabaseError catch (_) {
      emit(OnBoardingPageState.failed(supp, _.message));
    }
  }
}
