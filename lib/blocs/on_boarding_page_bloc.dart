import '../source.dart';
import '../utils/validation_logic.dart';

class OnBoardingPageBloc extends Cubit<OnBoardingPageState> {
  OnBoardingPageBloc(this.service) : super(OnBoardingPageState.initial());

  final UserService service;

  Pages? _page;

  void init(Pages page, {String? email}) {
    _page = page;
    _initVerificationPage(page, email);
    _initAdditionalInfoPage(page);
  }

  void updateUserDetails(
      {String? displayName, String? email, String? password, int? currency}) {
    var supp = state.supplements;
    emit(OnBoardingPageState.loading(supp));
    var userCurrency = supp.user.currencyCodePoint;
    if (currency != null) {
      if (userCurrency == currency) {
        userCurrency = 0;
      } else {
        userCurrency = currency;
      }
    }
    final user = supp.user.copyWith(
        email: email?.trim() ?? supp.user.email,
        displayName: displayName?.trim() ?? supp.user.displayName,
        currencyCodePoint: userCurrency);
    supp = supp.copyWith(user: user, password: password ?? supp.password);
    emit(OnBoardingPageState.content(supp));
  }

  void sendEmailForVerification() async {
    _validate();

    var supp = state.supplements;
    final hasErrors = checkErrors(supp.errors);
    if (hasErrors) return;

    emit(OnBoardingPageState.loading(supp));
    try {
      await service.sendEmailVerificationEmail(supp.user.email);
      emit(OnBoardingPageState.success(supp));
    } on ApiErrors catch (e) {
      emit(OnBoardingPageState.failed(supp, message: e.message));
    }
  }

  void checkEmailVerificationStatus() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.loading(supp));
    try {
      await service.checkIfEmailIsVerified(supp.user.email);
      emit(OnBoardingPageState.success(supp));
    } on ApiErrors catch (e) {
      emit(OnBoardingPageState.failed(supp, message: e.message));
    }
  }

  void initSocialOption(String option) async {
    var supp = state.supplements;
    emit(OnBoardingPageState.loading(supp));
    try {
      final isSuccessful = option == SigningUpOptions.facebook
          ? await service.getUserFacebookDetails()
          : await service.getUserGoogleDetails();
      if (!isSuccessful) {
        emit(OnBoardingPageState.content(supp));
        return;
      }
      emit(OnBoardingPageState.success(supp));
    } on ApiErrors catch (e) {
      emit(OnBoardingPageState.failed(supp, message: e.message));
    }
  }

  void signUp() async {
    _validate();

    var supp = state.supplements;
    final hasErrors = checkErrors(supp.errors);
    if (hasErrors) return;

    emit(OnBoardingPageState.loading(supp));
    try {
      await service.signUp(supp.user, supp.password);
      emit(OnBoardingPageState.success(supp));
    } on ApiErrors catch (e) {
      emit(OnBoardingPageState.failed(supp, message: e.message));
    }
  }

  void signOut() async {
    var supp = state.supplements;
    emit(OnBoardingPageState.loading(supp));

    try {
      await service.signOut();
      supp = OnBoardingSupplements.empty();
      emit(OnBoardingPageState.success(supp));
    } on ApiErrors catch (e) {
      emit(OnBoardingPageState.failed(supp, message: e.message));
    }
  }

  void _validate() {
    var supp = state.supplements;
    final errors = <String, String?>{};

    emit(OnBoardingPageState.loading(supp));
    switch (_page) {
      case Pages.email_password_registration_page:
        errors['email'] = validateEmail(supp.user.email);
        break;
      case Pages.additional_info_page:
        errors['password'] = validatePassword(supp.password);
        errors['username'] = validateText(supp.user.displayName, 'Username');
        break;
      case Pages.login_page:
        errors['email'] = validateEmail(supp.user.email);
        errors['password'] = validatePassword(supp.password);
        break;
      case Pages.verification_page:
      case null:
        break;
    }

    supp = supp.copyWith(errors: errors);
    emit(OnBoardingPageState.content(supp));
  }

  _initAdditionalInfoPage(Pages page) {
    if (page != Pages.additional_info_page) return;
    var supp = state.supplements;
    emit(OnBoardingPageState.loading(state.supplements));
    supp = supp.copyWith(user: service.getUser);
    emit(OnBoardingPageState.content(supp));
  }

  _initVerificationPage(Pages page, String? email) {
    if (page != Pages.verification_page) return;
    var supp = state.supplements;
    emit(OnBoardingPageState.loading(state.supplements));
    final user = supp.user;
    supp = supp.copyWith(user: user.copyWith(email: email!));
    emit(OnBoardingPageState.content(supp));
  }
}
