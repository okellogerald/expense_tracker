import 'package:budgetting_app/utils/navigation_logic.dart';

import '../source.dart';

class EmailPasswordAuthPage extends StatefulWidget {
  const EmailPasswordAuthPage({Key? key}) : super(key: key);

  @override
  _EmailPasswordAuthPageState createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends State<EmailPasswordAuthPage> {
  late final OnBoardingPageBloc bloc;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    final userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
    bloc.init(Pages.email_password_registration_page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
        bloc: bloc,
        listener: (_, state) {
          final isSuccess =
              state.maybeWhen(success: (_) => true, orElse: () => false);
          if (isSuccess) push(VerificationPage(state.supplements.user.email));

          final error =
              state.maybeWhen(failed: (_, error) => error, orElse: () => null);
          if (error != null) showSnackBar(error, scaffoldKey: _key);
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
      key: _key,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSizeConfig.getFullHeight,
          child: Column(
            children: [_buildTitle(), _buildBody(supp)],
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

  _buildBody(OnBoardingSupplements supp) {
    final noEmailEntered = supp.user.email.isEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        children: [
          SizedBox(height: 60.dh),
          AppTextField(
              errors: supp.errors,
              text: supp.user.email,
              onChanged: (email) => bloc.updateUserDetails(email: email),
              hintText: 'Email',
              suffixIcon: Icons.mail_outlined,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              errorName: 'email'),
          noEmailEntered
              ? Container()
              : AppTextButton(
                  onPressed: bloc.sendEmailForVerification,
                  height: 50.dh,
                  margin: EdgeInsets.only(top: 65.dh),
                  buttonColor: AppColors.onBackground,
                  text: 'CONTINUE')
        ],
      ),
    );
  }
}
