import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_details_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';

class EmailPasswordAuthPage extends ConsumerStatefulWidget {
  const EmailPasswordAuthPage({Key? key}) : super(key: key);

  @override
  _EmailPasswordAuthPageState createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends ConsumerState<EmailPasswordAuthPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      next!.maybeWhen(
          done: () => push(const MainPage()),
          failed: (message) => showSnackBar(message!),
          orElse: () {});
    });

    return userState.maybeWhen(loading: _buildLoading, orElse: _buildContent);
  }

  Widget _buildLoading() => const AppLoadingIndicator.withScaffold();

  Widget _buildContent() {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSizeConfig.getFullHeight,
          child: Column(
            children: [_buildTitle(), _buildBody()],
          ),
        ),
      ),
    );
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
          AppText('Email & Password Registration',
              size: 24.dw, family: kFontFam2),
          SizedBox(height: 10.dh),
          AppText('Please provide a valid email to continue',
              size: 16.dw, color: AppColors.onBackground2),
        ],
      ),
    );
  }

  _buildBody() {
    final errors =
        ref.watch(userDetailsValidationErrorsProvider(Pages.login_page));
    final user = ref.watch(userDetailsProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        children: [
          SizedBox(height: 60.dh),
          AppTextField(
              errors: errors,
              text: user.email,
              onChanged: (email) => ref
                  .read(userNotifierProvider.notifier)
                  .updateUserDetails(email: email),
              hintText: 'Email',
              suffixIcon: Icons.mail_outlined,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              errorName: 'email'),
          user.email.isEmpty
              ? Container()
              : AppTextButton(
                  onPressed: ref
                      .read(userNotifierProvider.notifier)
                      .sendEmailVerificationLink,
                  height: 50.dh,
                  margin: EdgeInsets.only(top: 65.dh),
                  buttonColor: AppColors.onBackground,
                  text: 'CONTINUE')
        ],
      ),
    );
  }
}
