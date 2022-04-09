import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pages_provider.dart';
import '../providers/user_action_handler.dart';
import '../providers/user_details_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../widgets/on_boarding_pages_title.dart';

class EmailPasswordAuthPage extends ConsumerStatefulWidget {
  const EmailPasswordAuthPage({Key? key}) : super(key: key);

  @override
  _EmailPasswordAuthPageState createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends ConsumerState<EmailPasswordAuthPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static const currentPage = Pages.email_password_registration_page;

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

      print('listened from the email-verification-page');
      next!.maybeWhen(
          done: () => push(const VerificationPage()),
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
            child: Container(
                height: ScreenSizeConfig.getFullHeight,
                padding: EdgeInsets.symmetric(horizontal: 15.dw),
                child: Column(children: [
                  const OnBoardingPagesTitle(
                      title: 'Email & Password Registration',
                      subtitle: 'Please provide a valid email to continue.',
                      image: kRegisterImageurl),
                  _buildBody()
                ]))));
  }

  _buildBody() {
    final errors = ref.watch(userValidationErrorsProvider);
    final user = ref.watch(userDetailsProvider);

    return Column(
      children: [
        SizedBox(height: 60.dh),
        AppTextField(
            errors: errors,
            text: user.email,
            onChanged: (email) => updateUserDetails(ref, email: email),
            hintText: 'Email',
            suffixIcon: Icons.mail_outlined,
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            errorName: 'email'),
        user.email.isEmpty
            ? Container()
            : AppTextButton(
                onPressed: () =>
                    handleUserAction(ref, UserAction.sendVerificationLink),
                height: 50.dh,
                margin: EdgeInsets.only(top: 65.dh),
                buttonColor: AppColors.primary,
                text: 'CONTINUE')
      ],
    );
  }

  _init() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(pagesProvider.state).state = currentPage;
    });
  }
}
