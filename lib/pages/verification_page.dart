import 'package:budgetting_app/widgets/app_divider.dart';
import 'package:budgetting_app/widgets/on_boarding_pages_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/pages_provider.dart';
import '../providers/user_action_handler.dart';
import '../providers/user_details_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../utils/navigation_logic.dart';

class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static const currentPage = Pages.verification_page;

  @override
  void initState() {
    handleStateOnInit(ref, currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      if (ref.read(pagesProvider) != currentPage) return;
      next!.maybeWhen(
          done: () => pushAndRemoveUntil(const AdditionalInfoPage()),
          failed: (message) => showSnackBar(message, key: scaffoldKey),
          orElse: () {});
    });

    return WillPopScope(
      onWillPop: () =>
          handleStateOnPop(ref, Pages.email_password_registration_page),
      child: userState.maybeWhen(
          loading: (message) => AppLoadingIndicator.withScaffold(message),
          orElse: _buildContent),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      key: scaffoldKey,
      body: Scaffold(
          appBar: AppBar(),
          body: Padding(
              padding: EdgeInsets.only(left: 15.dw, right: 15.dw),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OnBoardingPagesTitle(
                        title: 'Verification page',
                        subtitle:
                            'We sent a verification link to your email address. Click it to verify your account',
                        icon: FontAwesomeIcons.stamp),
                    _buildEmailDetails()
                  ])),
          bottomNavigationBar: _buildVerifyButton()),
    );
  }

  _buildEmailDetails() {
    final user = ref.watch(userDetailsProvider);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 50.dh),
      AppText('Email address used:',
          size: 16.dw, color: AppColors.onBackground2),
      SizedBox(height: 10.dh),
      AppText(user.email,
          size: 15.dw, color: AppColors.onBackground, family: kFontFam2),
      AppDivider(width: 300.dw),
      AppTextButton(
        onPressed: () => Navigator.pop(context),
        text: 'Change Email',
        margin: EdgeInsets.only(top: 10.dh),
        padding: EdgeInsets.symmetric(horizontal: 10.dw, vertical: 8.dh),
        textColor: AppColors.primary,
        buttonColor: Colors.white.withOpacity(.15),
        width: 130.dw,
      )
    ]);
  }

  _buildVerifyButton() {
    return AppTextButton(
        onPressed: () => handleUserAction(ref, UserAction.verifyEmail),
        text: 'I AM ALREADY VERIFIED',
        buttonColor: AppColors.primary,
        isBolded: true,
        margin: EdgeInsets.only(bottom: 20.dh, left: 15.dw, right: 15.dw),
        height: 50.dh);
  }
}
