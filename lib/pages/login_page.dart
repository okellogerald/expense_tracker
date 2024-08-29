import 'package:expense_tracker/widgets/on_boarding_pages_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../source.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // handleStateOnInit(ref, currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

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
              const OnBoardingPagesTitle(
                title: 'Welcome !',
                subtitle: 'Please log in to continue',
                image: 'assets/images/logo.png',
              ),
              _buildEmailTextField(),
              _buildNeedHelp(),
              _buildNewUser()
            ],
          ),
        ),
      ),
    );
  }

  _buildEmailTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 80.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.dh),
          AppTextField(
              errors: const {},
              text: "",
              onChanged: (email) {},
              hintText: 'Email',
              suffixIcon: Icons.mail_outlined,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              errorName: 'email'),
          SizedBox(height: 15.dh),
          PasswordTextField(
            errors: const {},
            text: "",
            onChanged: (password) {},
            suffixIcon: Icons.lock_outlined,
            isLoginPassword: true,
          ),
          AppTextButton(
            // onPressed: () => handleUserAction(ref, UserAction.logIn),
            onPressed: () {},
            text: 'LOG IN',
            textColor: AppColors.onPrimary,
            buttonColor: AppColors.primary,
            isBolded: true,
            height: 50.dh,
            fontSize: 16.dw,
            margin: EdgeInsets.only(top: 25.dh, bottom: 10.dh),
          )
        ],
      ),
    );
  }

  _buildNewUser() {
    return Padding(
      padding: EdgeInsets.only(top: 30.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.dw),
            child: AppText("Don't have an account ?",
                size: 15.dw, color: AppColors.onBackground2),
          ),
        ],
      ),
    );
  }

  _buildNeedHelp() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppText('NEED HELP ?', size: bodyTextSize, color: AppColors.primary)
    ]);
  }
}
