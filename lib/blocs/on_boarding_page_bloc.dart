import '../source.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  void signUpWithGoogle() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final user = await service.signUpWithGoogle();
    if (user == null) {
      const message = 'An error occured, please try again';
      emit(OnBoardingPageState.failed(supp, message));
      return;
    }
    supp = supp.copyWith(client: user);
    emit(OnBoardingPageState.success(supp));
  }

  void loginWithFacebook() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final user = await service.logInWithFacebook();
    if (user == null) {
      const message = 'An error occured, please try again';
      emit(OnBoardingPageState.failed(supp, message));
      return;
    }
    supp = supp.copyWith(client: user);
    emit(OnBoardingPageState.success(supp));
  }

  void logInWithGoogle() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final user = await service.logInWithGoogle();
    log('$user');
    if (user == null) {
      const message = 'No email matches this account.';
      emit(OnBoardingPageState.failed(supp, message));
      return;
    }
    supp = supp.copyWith(client: user);
    emit(OnBoardingPageState.success(supp));
  }
}
