import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/providers/user_notifier.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      next!.maybeWhen(
          done: () => push(const MainPage()),
          failed: (message) => showSnackBar(message!, scaffoldKey: scaffoldKey),
          orElse: () {});
    });

    return userState.maybeWhen(loading: _buildLoading, orElse: _buildContent);
  }

  Widget _buildLoading() => const AppLoadingIndicator.withScaffold();

  Widget _buildContent() {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenSizeConfig.getFullHeight,
          padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 10.dh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              _buildPhoneTextField(),
              _buildNeedHelp(),
              _buildNewUser()
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Container(
      padding: EdgeInsets.only(top: 60.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.dh),
          Center(
              child: Image.asset('assets/images/logo.png',
                  height: 60.dh, fit: BoxFit.contain)),
          SizedBox(height: 100.dh),
          AppText('Welcome !', size: 32.dw, family: kFontFam2),
          SizedBox(height: 10.dh),
          AppText('Please log in to continue',
              size: 16.dw, color: AppColors.onBackground2)
        ],
      ),
    );
  }

  _buildPhoneTextField() {
    final errors =
        ref.watch(userDetailsValidationErrorsProvider(Pages.login_page));
    final user = ref.watch(userDetailsProvider);
    final password = ref.watch(passwordProvider);

    return Padding(
        padding: EdgeInsets.only(top: 80.dh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 5.dh),
          AppTextField(
              errors: errors,
              text: user.email,
              onChanged: (email) => ref
                  .read(userNotifierProvider.notifier)
                  .updateUserDetails(email: email),
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
              onPressed: ref.read(userNotifierProvider.notifier).logIn,
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
              isBolded: true,
              fontSize: 16.dw)
        ]));
  }

  _buildNeedHelp() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppCheckBox(onChanged: (_) {}),
      AppText('NEED HELP ?', size: bodyTextSize, color: AppColors.primary)
    ]);
  }
}
