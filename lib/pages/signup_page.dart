import '../source.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                _navigateToVerificationPage();
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
            child: Image.network(kRegisterImageurl,
                height: 80.dh, fit: BoxFit.contain),
          ),
          SizedBox(height: 120.dh),
          AppText(
            'Sign-up page',
            size: 28.dw,
            family: kFontFam2,
          ),
          SizedBox(height: 10.dh),
          AppText(
            'Choose your preferred method for signing up.',
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
            errorName: 'password',
            isPassword: true,
          ),
          SizedBox(height: 25.dh),
          AppTextButton(
            onPressed: bloc.sendOTP,
            text: 'Sign up',
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
                  onPressed: () {},
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
                  onPressed: () {},
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
          AppText(
            'Already have an account ?',
            size: 15.dw,
            color: AppColors.onBackground2,
          ),
          AppTextButton(
            onPressed: _onLoginPressed,
            text: 'Log-in',
            textColor: AppColors.primary,
            margin: EdgeInsets.only(left: 15.dw),
            isBolded: true,
            fontSize: 16.dw,
          ),
        ],
      ),
    );
  }

  _onLoginPressed() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const LoginPage()));

  _navigateToVerificationPage() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const VerificationPage()));
}
