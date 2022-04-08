import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_details_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../widgets/type_selector.dart';

class AdditionalInfoPage extends ConsumerStatefulWidget {
  const AdditionalInfoPage({Key? key}) : super(key: key);

  @override
  _AdditionalInfoPageState createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends ConsumerState<AdditionalInfoPage> {
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
        body: ListView(
            padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 20.dh),
            children: [
              _buildTitle(),
              _buildTextFields(),
              SizedBox(height: 20.dh),
              CurrencySelector(
                  onCurrencySelected: (currency) => ref
                      .read(userNotifierProvider.notifier)
                      .updateUserDetails(currency: currency)),
              _buildDoneButton()
            ]));
  }

  _buildTitle() {
    return Container(
      padding: EdgeInsets.only(top: 60.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.dh),
          Center(
              child: Image.network(kCompleteImageUrl,
                  height: 80.dh, fit: BoxFit.contain)),
          SizedBox(height: 120.dh),
          AppText('One final step', size: 28.dw, family: kFontFam2),
          SizedBox(height: 10.dh),
          AppText(
              'Complete the on-boarding process by filling the details below.',
              size: 16.dw,
              color: AppColors.onBackground2)
        ],
      ),
    );
  }

  _buildTextFields() {
    final errors =
        ref.watch(userDetailsValidationErrorsProvider(Pages.login_page));
    final user = ref.watch(userDetailsProvider);
    final password = ref.watch(passwordProvider);

    return Column(
      children: [
        SizedBox(height: 40.dh),
        AppTextField(
            errors: errors,
            text: user.displayName,
            onChanged: (name) => ref
                .read(userNotifierProvider.notifier)
                .updateUserDetails(displayName: name),
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
        onPressed: ref.read(userNotifierProvider.notifier).signUp,
        buttonColor: AppColors.onBackground,
        text: 'DONE',
        height: 50.dh,
        margin: EdgeInsets.only(top: 30.dh));
  }
}
