import '../source.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final OnBoardingPageBloc bloc;
  late final UserService userService;

  @override
  void initState() {
    userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
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
                MainPage.navigateTo(context);
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
        padding: EdgeInsets.symmetric(horizontal: 10.dw, vertical: 5.dh),
        content: AppText(
          message,
          size: 16.dw,
          color: AppColors.onError,
        )));
  }

  Widget _buildLoading(OnBoardingSupplements supp) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      width: ScreenSizeConfig.getFullWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 20.dh),
          AppText('logging in...', size: 16.dw, color: AppColors.onBackground2)
        ],
      ),
    );
  }

  Widget _buildContent(OnBoardingSupplements supp) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildPhoneTextField(),
          _buildOtherAuthenticators(),
          _buildNewUser(),
        ],
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
                height: 60.dh, fit: BoxFit.contain),
          ),
          SizedBox(height: 100.dh),
          AppText(
            'Welcome !',
            size: 30.dw,
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

  _buildPhoneTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 100.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Enter your phone number:',
            size: 16.dw,
            color: AppColors.onBackground2,
          ),
          SizedBox(height: 5.dh),
          AppTextField(
            errors: const {},
            text: '',
            onChanged: (_) {},
            hintText: 'Phone number',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 25.dh),
          AppTextButton(
            onPressed: () {},
            text: 'Log in',
            buttonColor: AppColors.primary,
            isBolded: true,
            height: 40.dh,
            fontSize: 16.dw,
          )
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
                  onPressed: bloc.logInWithGoogle,
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
