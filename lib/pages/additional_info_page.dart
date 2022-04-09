import 'package:budgetting_app/providers/pages_provider.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_action_handler.dart';
import '../providers/user_details_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../widgets/on_boarding_pages_title.dart';
import '../widgets/type_selector.dart';

class AdditionalInfoPage extends ConsumerStatefulWidget {
  const AdditionalInfoPage({Key? key}) : super(key: key);

  @override
  _AdditionalInfoPageState createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends ConsumerState<AdditionalInfoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static const currentPage = Pages.additional_info_page;

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
          done: () => pushAndRemoveUntil(const MainPage()),
          failed: (message) => showSnackBar(message),
          orElse: () {});
    });

    return userState.maybeWhen(loading: _buildLoading, orElse: _buildContent);
  }

  Widget _buildLoading() => const AppLoadingIndicator.withScaffold();

  Widget _buildContent() {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        body: ListView(
            padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 20.dh),
            children: [
              const OnBoardingPagesTitle(
                  title: 'One final step',
                  subtitle:
                      'Complete the on-boarding process by filling the details below.',
                  image: kCompleteImageUrl),
              _buildTextFields(),
              SizedBox(height: 20.dh),
              CurrencySelector(
                  onCurrencySelected: (currency) =>
                      updateUserDetails(ref, currency: currency)),
              _buildDoneButton()
            ]));
  }

  _buildTextFields() {
    final errors = ref.watch(userValidationErrorsProvider);
    final user = ref.watch(userDetailsProvider);
    final password = ref.watch(passwordProvider);

    return Column(
      children: [
        SizedBox(height: 40.dh),
        AppTextField(
            errors: errors,
            text: user.displayName,
            onChanged: (name) => updateUserDetails(ref, displayName: name),
            hintText: 'Username',
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            errorName: 'username'),
        SizedBox(height: 30.dh),
        PasswordTextField(
            errors: errors,
            text: password,
            onChanged: (password) =>
                ref.read(passwordProvider.state).state = password),
      ],
    );
  }

  _buildDoneButton() {
    return AppTextButton(
        onPressed: () => handleUserAction(ref, UserAction.signUp),
        buttonColor: AppColors.onBackground,
        text: 'DONE',
        height: 50.dh,
        margin: EdgeInsets.only(top: 30.dh));
  }

  _init() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(pagesProvider.state).state = currentPage;
    });
  }
}
