import 'package:budgetting_app/theme/app_ui_constant_styles.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';

import '../source.dart';
import '../widgets/app_check_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final OnBoardingPageBloc bloc;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    final userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
    bloc.init(Pages.login_page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
        bloc: bloc,
        listener: (_, state) {
          final hasSucceeded =
              state.maybeWhen(success: (_) => true, orElse: () => false);
          if (hasSucceeded) pushAndRemoveUntil(const MainPage());

          final error =
              state.maybeWhen(failed: (_, error) => error, orElse: () => null);
          if (error != null) showSnackBar(error, scaffoldKey: scaffoldKey);
        },
        builder: (_, state) {
          return state.when(
            loading: _buildLoading,
            content: _buildContent,
            success: _buildContent,
            failed: (supp, _) => _buildContent(supp),
          );
        });
  }

  Widget _buildLoading(OnBoardingSupplements supp) =>
      const AppLoadingIndicator.withScaffold();

  Widget _buildContent(OnBoardingSupplements supp) {
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
              _buildPhoneTextField(supp),
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

  _buildPhoneTextField(OnBoardingSupplements supp) {
    return Padding(
        padding: EdgeInsets.only(top: 80.dh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 5.dh),
          AppTextField(
              errors: supp.errors,
              text: supp.user.email,
              onChanged: (email) => bloc.updateUserDetails(email: email),
              hintText: 'Email',
              suffixIcon: Icons.mail_outlined,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              errorName: 'email'),
          SizedBox(height: 15.dh),
          PasswordTextField(
              errors: supp.errors,
              text: supp.password,
              onChanged: (password) =>
                  bloc.updateUserDetails(password: password),
              suffixIcon: Icons.lock_outlined,
              isLoginPassword: true),
          AppTextButton(
              onPressed: bloc.logIn,
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
              onPressed: _onPressed,
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

  _onPressed() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const SignUpPage()));
}
