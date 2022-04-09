import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pages_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../utils/navigation_logic.dart';
import 'email_password_registration_page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static const currentPage = Pages.signup_page;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      if (ref.read(pagesProvider) != currentPage) return;
      print('listened from the sign-up page');

      next!.maybeWhen(
          done: () => push(const AdditionalInfoPage()),
          failed: (message) => showSnackBar(message!, scaffoldKey: scaffoldKey),
          orElse: () {});
    });

    return userState.maybeWhen(loading: _buildLoading, orElse: _buildContent);
  }

  Widget _buildLoading() => const AppLoadingIndicator.withScaffold();

  Widget _buildContent() {
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

  Widget _buildTextButton(String text, [String? signUpOption]) {
    return AppTextButton(
        onPressed: () {
          final userNotifier = ref.read(userNotifierProvider.notifier);
          signUpOption == null
              ? push(const EmailPasswordAuthPage())
              : userNotifier.getUserSocialAccountDetails(signUpOption);
        },
        text: text,
        height: 45.dh,
        textColor: AppColors.onBackground2,
        borderColor: AppColors.primary,
        margin: EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 20.dh),
        borderRadius: 20.dw,
        fontSize: 16.dw);
  }

  _init() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(pagesProvider.state).state = currentPage;
    });
  }
}
