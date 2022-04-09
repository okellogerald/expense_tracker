import 'package:budgetting_app/widgets/on_boarding_pages_title.dart';
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
      next!.maybeWhen(
          done: () => pushAndRemoveUntil(const AdditionalInfoPage()),
          failed: (message) => showSnackBar(message, scaffoldKey: scaffoldKey),
          orElse: () {});
    });

    return userState.maybeWhen(loading: _buildLoading, orElse: _buildContent);
  }

  Widget _buildLoading() => const AppLoadingIndicator.withScaffold();

  Widget _buildContent() {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.dw),
          child: Column(children: [
            const OnBoardingPagesTitle(
              image: kRegisterImageurl,
              title: 'Sign-up Options',
              subtitle: 'Choose your preferred method for signing up.',
            ),
            _buildSignUpChoices()
          ]),
        ));
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
        margin: EdgeInsets.only(bottom: 20.dh),
        borderRadius: 20.dw,
        fontSize: 16.dw);
  }

  _init() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(pagesProvider.state).state = currentPage;
    });
  }
}
