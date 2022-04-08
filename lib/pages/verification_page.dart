import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      next!.maybeWhen(
          done: () => push(const MainPage()),
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
        body: Padding(
            padding: EdgeInsets.only(left: 15.dw, right: 15.dw),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildTitle(), _buildEmailDetails()])),
        bottomNavigationBar: _buildVerifyButton());
  }

  _buildTitle() {
    return Container(
      padding: EdgeInsets.only(top: 60.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.dh),
          Center(
              child: Image.network(kVerifyImage3Url,
                  height: 80.dh, fit: BoxFit.contain)),
          SizedBox(height: 120.dh),
          AppText('Verification page', size: 28.dw, family: kFontFam2),
          SizedBox(height: 10.dh),
          AppText(
              'We sent a verification link to your email address. Click it to verify your account',
              size: 16.dw,
              color: AppColors.onBackground2)
        ],
      ),
    );
  }

  _buildEmailDetails() {
    final user = ref.watch(userDetailsProvider);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 50.dh),
      AppText('Email address used:',
          size: 16.dw, color: AppColors.onBackground2),
      SizedBox(height: 10.dh),
      AppText(user.email, size: 15.dw, color: AppColors.onBackground2),
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
        onPressed:
            ref.read(userNotifierProvider.notifier).checkIfEmailIsVerified,
        text: 'I AM ALREADY VERIFIED',
        buttonColor: AppColors.onBackground,
        margin: EdgeInsets.only(bottom: 20.dh, left: 15.dw, right: 15.dw),
        height: 50.dh);
  }
}
