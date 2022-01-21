import '../source.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  void signupWithGoogle() async => await _onboard(true, Providers.google);

  void loginWithGoogle() async => await _onboard(false, Providers.google);

  void signupWithFacebook() async => await _onboard(true, Providers.facebook);

  void loginWithFacebook() async => await _onboard(false, Providers.facebook);

  Future<void> _onboard(bool isSigningUp, String provider) async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));

    Client? user;

    try {
      switch (provider) {
        case Providers.email_password:
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
