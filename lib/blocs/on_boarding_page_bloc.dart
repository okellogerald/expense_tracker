import '../source.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  /* void signupWithGoogle() async => await _onboard(true, Providers.google);

  void loginWithGoogle() async => await _onboard(false, Providers.google);

  void signupWithFacebook() async => await _onboard(true, Providers.facebook);

  void loginWithFacebook() async => await _onboard(false, Providers.facebook);*/

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
      emit(OnBoardingPageState.content(supp));
    } on ApiError catch (_) {
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
  }

  void updateUser() async {
    var supp = state.supplements.copyWith(errors: {});
    emit(OnBoardingPageState.laoding(supp));

    _validateName();
    if (supp.errors.isNotEmpty) return;

    emit(OnBoardingPageState.laoding(supp));
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
        //await service.checkIfRegisteredWithSocial(supp.user.email);
        //await service.sendOTP(supp.user.email);
        emit(OnBoardingPageState.success(supp));
      } on ApiError catch (_) {
        emit(OnBoardingPageState.failed(supp, _.message));
      }
    } else {
      // await _onboard(isSigningUp, Providers.email_password);
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

    supp = supp.copyWith();
    emit(OnBoardingPageState.success(supp));
  }

  void updateCodePoint(int codePoint) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    supp = supp.copyWith(currency: codePoint);
    emit(OnBoardingPageState.content(supp));
  }

  void signOut() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    await service.signOut();
    supp = OnBoardingSupplements.empty();
    emit(OnBoardingPageState.success(supp));
  }
}
