import '../source.dart';
import '../utils/input_validation.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  Pages? _page;

  void init({Pages? page, String? email}) {
    _page = page;
    if (email != null) {
      if (page != Pages.verification_page) return;
      var supp = state.supplements;
      emit(OnBoardingPageState.laoding(state.supplements));
      final user = supp.user;
      supp = supp.copyWith(user: user.copyWith(email: email));
      emit(OnBoardingPageState.content(supp));
    }
    if (page != Pages.additional_info_page) return;
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(state.supplements));
    supp = supp.copyWith(user: service.getUser);
    emit(OnBoardingPageState.content(supp));
  }

  void updateUserDetails(
      {String? displayName, String? email, String? password, int? currency}) {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    final user = supp.user.copyWith(
        email: email ?? supp.user.email,
        displayName: displayName ?? supp.user.displayName,
        currencyCodePoint: currency ?? supp.user.currencyCodePoint);
    supp = supp.copyWith(user: user, password: password ?? supp.password);
    emit(OnBoardingPageState.content(supp));
  }

  void sendEmailForVerification() async {
    _validate();

    var supp = state.supplements;
    final hasErrors = InputValidation.checkErrors(supp.errors);
    if (hasErrors) return;

    emit(OnBoardingPageState.laoding(supp));
    try {
      await service.sendEmailVerificationEmail(supp.user.email);
      emit(OnBoardingPageState.success(supp));
    } on ApiError catch (e) {
      emit(OnBoardingPageState.failed(supp, e.message));
    }
  }

  void checkEmailVerificationStatus() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    try {
      await service.checkIfEmailIsVerified(supp.user.email);
      emit(OnBoardingPageState.success(supp));
    } on ApiError catch (e) {
      emit(OnBoardingPageState.failed(supp, e.message));
    }
  }

  void initSocialOption(String option) async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    try {
      final isSuccessful = option == SigningUpOptions.facebook
          ? await service.getUserFacebookDetails()
          : await service.getUserGoogleDetails();
      if (!isSuccessful) {
        emit(OnBoardingPageState.content(supp));
        return;
      }
      emit(OnBoardingPageState.success(supp));
    } on ApiError catch (e) {
      emit(OnBoardingPageState.failed(supp, e.message));
    }
  }

  void signUp() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    await service.signUp(supp.user, supp.password);
    emit(OnBoardingPageState.success(supp));
  }

  void signOut() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.laoding(supp));
    await service.signOut();
    supp = OnBoardingSupplements.empty();
    emit(OnBoardingPageState.success(supp));
  }

  void _validate() {
    var supp = state.supplements;
    final errors = <String, String?>{};

    emit(OnBoardingPageState.laoding(supp));
    switch (_page) {
      case Pages.email_password_registration_page:
        errors['email'] = InputValidation.validateEmail(supp.user.email);
        break;
      case Pages.additional_info_page:
        errors['password'] = InputValidation.validateEmail(supp.password);
        errors['username'] =
            InputValidation.validateEmail(supp.user.displayName);
        break;
      case Pages.login_page:
        errors['email'] = InputValidation.validateEmail(supp.user.email);
        errors['password'] = InputValidation.validateEmail(supp.password);
        break;
      case Pages.verification_page:
      case null:
        break;
    }

    supp = supp.copyWith(errors: errors);
    emit(OnBoardingPageState.content(supp));
  }
}
