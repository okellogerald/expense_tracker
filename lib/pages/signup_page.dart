import '../source.dart';
import '../utils/navigation_logic.dart';
import 'email_password_registration_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final OnBoardingPageBloc bloc;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    final userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
        bloc: bloc,
        listener: (_, state) {
          final isSuccess =
              state.maybeWhen(success: (_) => true, orElse: () => false);
          if (isSuccess) _navigateToAdditionalInfoPage();

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
        appBar: AppBar(),
        body: Column(children: [_buildTitle(), _buildSignUpChoices()]));
  }

  _buildTitle() {
    return Container(
      padding: EdgeInsets.only(top: 60.dh, left: 15.dw, right: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.dh),
          Center(
              child: Image.network(kRegisterImageurl,
                  height: 80.dh, fit: BoxFit.contain)),
          SizedBox(height: 120.dh),
          AppText('Sign-up Options', size: 28.dw, family: kFontFam2),
          SizedBox(height: 10.dh),
          AppText('Choose your preferred method for signing up.',
              size: 16.dw, color: AppColors.onBackground2),
        ],
      ),
    );
  }

  _buildSignUpChoices() {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildTextButton('EMAIL & PASSWORD'),
        _buildTextButton('GOOGLE', SigningUpOptions.google),
        _buildTextButton('FACEBOOK', SigningUpOptions.facebook)
      ]),
    );
  }

  Widget _buildTextButton(String text, [String? signingUpOption]) {
    return AppTextButton(
        onPressed: () {
          signingUpOption == null
              ? _goToEmailPasswordAuthPage()
              : bloc.initSocialOption(signingUpOption);
        },
        text: text,
        buttonColor: AppColors.secondary,
        height: 45.dh,
        margin: EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 20.dh),
        borderRadius: 20.dw,
        fontSize: 16.dw);
  }

  _goToEmailPasswordAuthPage() => Navigator.push(context,
      MaterialPageRoute(builder: (_) => const EmailPasswordAuthPage()));

  _navigateToAdditionalInfoPage() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const AdditionalInfoPage()));
}
