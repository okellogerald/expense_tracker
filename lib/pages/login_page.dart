import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/providers/user_notifier.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:budgetting_app/widgets/on_boarding_pages_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pages_provider.dart';
import '../providers/user_action_handler.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../widgets/app_check_box.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static const currentPage = Pages.login_page;

  @override
  void initState() {
    handleStateOnInit(ref, currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      if (ref.read(pagesProvider) != currentPage) return;
      next!.maybeWhen(
          done: () => pushAndRemoveUntil(const MainPage()),
          failed: (message) => showSnackBar(message, key: scaffoldKey),
          orElse: () {});
    });

    return WillPopScope(
      onWillPop: () => showExitAppDialog(context),
      child: userState.maybeWhen(
          loading: (message) => AppLoadingIndicator.withScaffold(message),
          orElse: _buildContent),
    );
  }

  Widget _buildContent([Map<String, String?> errors = const {}]) {
    return Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
            child: Container(
                height: ScreenSizeConfig.getFullHeight,
                padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 10.dh),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const OnBoardingPagesTitle(
                          title: 'Welcome !',
                          subtitle: 'Please log in to continue',
                          image: 'assets/images/logo.png'),
                      _buildEmailTextField(),
                      _buildNeedHelp(),
                      _buildNewUser()
                    ]))));
  }

  _buildEmailTextField() {
    final password = ref.watch(passwordProvider);
    final errors = ref.watch(userValidationErrorsProvider);
    final user = ref.watch(userDetailsProvider);

    return Padding(
        padding: EdgeInsets.only(top: 80.dh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 5.dh),
          AppTextField(
              errors: errors,
              text: user.email,
              onChanged: (email) => updateUserDetails(ref, email: email),
              hintText: 'Email',
              suffixIcon: Icons.mail_outlined,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              errorName: 'email'),
          SizedBox(height: 15.dh),
          PasswordTextField(
              errors: errors,
              text: password,
              onChanged: (password) =>
                  ref.read(passwordProvider.state).state = password,
              suffixIcon: Icons.lock_outlined,
              isLoginPassword: true),
          AppTextButton(
              onPressed: () => handleUserAction(ref, UserAction.logIn),
              text: 'LOG IN',
              textColor: AppColors.onPrimary,
              buttonColor: AppColors.primary,
              isBolded: true,
              height: 50.dh,
              fontSize: 16.dw,
              margin: EdgeInsets.only(top: 25.dh, bottom: 10.dh))
        ]));
  }

  _buildNewUser() {
    return Padding(
        padding: EdgeInsets.only(top: 30.dh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 15.dw),
            child: AppText("Don't have an account ?",
                size: 15.dw, color: AppColors.onBackground2),
          ),
          AppTextButton(
              onPressed: () => push(const SignUpPage()),
              text: 'Register',
              margin: EdgeInsets.only(top: 10.dh),
              height: 50.dh,
              textColor: AppColors.primary,
              buttonColor: Colors.white.withOpacity(.15),
              fontSize: 16.dw)
        ]));
  }

  _buildNeedHelp() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppCheckBox(onChanged: (v) {
        if (v != null) ref.read(rememberMeValueProvider.state).state = v;
      }),
      AppText('NEED HELP ?', size: bodyTextSize, color: AppColors.primary)
    ]);
  }
}
