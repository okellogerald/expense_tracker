import '../source.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
    ));
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
            color: appColors.textColor2,
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
            color: appColors.textColor2,
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
            buttonColor: appColors.primaryColor,
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
            color: appColors.textColor2,
          ),
          SizedBox(height: 30.dh),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: () {},
                  text: 'Google',
                  buttonColor: Colors.white,
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
                  buttonColor: Colors.white,
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
          AppText('New User ?', size: 16.dw),
          AppTextButton(
            onPressed: () {},
            text: 'Register',
            textColor: AppColors.accentColor,
            margin: EdgeInsets.only(left: 15.dw),
            isBolded: true,
            fontSize: 16.dw,
          ),
        ],
      ),
    );
  }
}
