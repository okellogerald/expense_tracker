import '../source.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final OnBoardingPageBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<OnBoardingPageBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
            bloc: bloc,
            listener: (_, state) {
              final hasSucceded =
                  state.maybeWhen(success: (_) => true, orElse: () => false);

              final hasFailed =
                  state.maybeWhen(failed: (_, __) => true, orElse: () => false);

              if (hasSucceded) {
                if (!state.supplements.user.isProfileComplete) {
                  AdditionalInfoPage.navigateTo(context);
                } else {
                  MainPage.navigateTo(context);
                }
              }

              if (hasFailed) {
                final message =
                    state.maybeWhen(failed: (_, m) => m, orElse: () => null);
                _showSnackBar(message!);
              }
            },
            builder: (_, state) {
              return state.when(
                laoding: _buildLoading,
                content: _buildContent,
                success: _buildContent,
                failed: (supp, _) => _buildContent(supp),
              );
            }));
  }

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.error,
        padding: EdgeInsets.symmetric(horizontal: 10.dw, vertical: 5.dh),
        content: Material(
          color: AppColors.error,
          child: AppText(
            message,
            size: 14.dw,
            color: AppColors.onError,
            alignment: TextAlign.start,
          ),
        )));
  }

  Widget _buildLoading(OnBoardingSupplements supp) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      width: ScreenSizeConfig.getFullWidth,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.primary)),
    );
  }

  Widget _buildContent(OnBoardingSupplements supp) {
    return ListView(
      padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 20.dh),
      children: [
        _buildTitle(),
        _buildPhoneTextField(supp),
        _buildOtherAuthenticators(),
        _buildNewUser(),
      ],
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
                height: 60.dh, fit: BoxFit.contain),
          ),
          SizedBox(height: 100.dh),
          AppText(
            'Welcome !',
            size: 32.dw,
            family: kFontFam2,
          ),
          SizedBox(height: 10.dh),
          AppText(
            'Sign in to continue',
            size: 16.dw,
            color: AppColors.onBackground2,
          ),
        ],
      ),
    );
  }

  _buildPhoneTextField(OnBoardingSupplements supp) {
    return Padding(
      padding: EdgeInsets.only(top: 80.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.dh),
          AppTextField(
            errors: supp.errors,
            text: supp.user.email,
            onChanged: bloc.updateEmail,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            errorName: 'email',
          ),
          SizedBox(height: 15.dh),
          AppTextField(
            errors: supp.errors,
            text: supp.password,
            onChanged: bloc.updatePassword,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textCapitalization: TextCapitalization.none,
            isLoginPasswrd: true,
            errorName: 'password',
          ),
          AppTextButton(
            onPressed: bloc.loginWithEmailPassword,
            text: 'Log in',
            buttonColor: AppColors.primary,
            isBolded: true,
            height: 40.dh,
            fontSize: 16.dw,
            margin: EdgeInsets.only(top: 25.dh, bottom: 10.dh),
          ),
          AppTextButton(
            onPressed: () {},
            text: 'Forgot password ?',
            textColor: AppColors.primary,
            fontSize: 16.dw,
            width: 140.dw,
          ),
        ],
      ),
    );
  }

  _buildOtherAuthenticators() {
    return Padding(
      padding: EdgeInsets.only(top: 60.dh),
      child: Column(
        children: [
          AppText(
            'or continue with:',
            size: 16.dw,
            color: AppColors.onBackground2,
          ),
          SizedBox(height: 30.dh),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: bloc.loginWithGoogle,
                  text: 'Google',
                  buttonColor: AppColors.secondary,
                  isBolded: true,
                  height: 40.dh,
                  fontSize: 16.dw,
                ),
              ),
              SizedBox(width: 25.dw),
              Expanded(
                child: AppTextButton(
                  onPressed: bloc.loginWithFacebook,
                  text: 'Facebook',
                  buttonColor: AppColors.secondary,
                  isBolded: true,
                  height: 40.dh,
                  fontSize: 16.dw,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildNewUser() {
    return Padding(
      padding: EdgeInsets.only(top: 30.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppText('New User ?', size: 15.dw, color: AppColors.onBackground2),
          AppTextButton(
            onPressed: _onPressed,
            text: 'Register',
            textColor: AppColors.primary,
            margin: EdgeInsets.only(left: 15.dw),
            isBolded: true,
            fontSize: 16.dw,
          ),
        ],
      ),
    );
  }

  _onPressed() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const SignUpPage()));
}
