import 'package:budgetting_app/utils/navigation_logic.dart';

import '../source.dart';
import '../widgets/type_selector.dart';

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({Key? key}) : super(key: key);

  @override
  _AdditionalInfoPageState createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  late final OnBoardingPageBloc bloc;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    final userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
    bloc.init(Pages.additional_info_page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
        bloc: bloc,
        listener: (_, state) {
          final isSuccess =
              state.maybeWhen(success: (_) => true, orElse: () => false);
          if (isSuccess) pushAndRemoveUntil(const MainPage());

          final error =
              state.maybeWhen(failed: (_, error) => error, orElse: () => null);
          if (error != null) showSnackBar(error, scaffoldKey: scaffoldKey);
        },
        builder: (_, state) {
          return state.when(
              loading: _buildLoading,
              content: _buildContent,
              success: _buildContent,
              failed: (supp, _) => _buildContent(supp));
        });
  }

  Widget _buildLoading(OnBoardingSupplements supp) =>
      const AppLoadingIndicator.withScaffold();

  Widget _buildContent(OnBoardingSupplements supp) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        body: ListView(
            padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 20.dh),
            children: [
              _buildTitle(),
              _buildTextFields(supp),
              SizedBox(height: 20.dh),
              CurrencySelector(
                  onCurrencySelected: (currency) =>
                      bloc.updateUserDetails(currency: currency)),
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

  _buildTextFields(OnBoardingSupplements supp) {
    return Column(
      children: [
        SizedBox(height: 40.dh),
        AppTextField(
            errors: supp.errors,
            text: supp.user.displayName,
            onChanged: (name) => bloc.updateUserDetails(displayName: name),
            hintText: 'Username',
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            errorName: 'username'),
        SizedBox(height: 30.dh),
        PasswordTextField(
            errors: supp.errors,
            text: supp.password,
            onChanged: (password) => bloc.updateUserDetails(password: password))
      ],
    );
  }

  _buildDoneButton() {
    return AppTextButton(
        onPressed: bloc.signUp,
        buttonColor: AppColors.onBackground,
        text: 'DONE',
        height: 50.dh,
        margin: EdgeInsets.only(top: 30.dh));
  }
}
