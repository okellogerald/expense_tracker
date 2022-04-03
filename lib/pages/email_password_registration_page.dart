import 'package:budgetting_app/utils/global_functions.dart';

import '../source.dart';

class EmailPasswordAuthPage extends StatefulWidget {
  const EmailPasswordAuthPage({Key? key}) : super(key: key);

  @override
  _EmailPasswordAuthPageState createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends State<EmailPasswordAuthPage> {
  late final OnBoardingPageBloc bloc;

  @override
  void initState() {
    final userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
    bloc.init(page: Pages.email_password_registration_page);
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

          final hasFailed =
              state.maybeWhen(failed: (_, __) => true, orElse: () => false);
          if (hasFailed) {
            final message =
                state.maybeWhen(failed: (_, m) => m, orElse: () => null);
            _showSnackBar(message!);
          }
        },
        builder: (_, state) {
          return state.when(
            laoding: _buildLoading,
            content: _buildContent,
            success: _buildContent,
            failed: (supp, _) => _buildContent(supp),
          );
        });
  }

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.error,
        padding: EdgeInsets.symmetric(horizontal: 10.dw, vertical: 5.dh),
        content: Material(
            color: AppColors.error,
            child: AppText(
              message,
              size: 14.dw,
              color: AppColors.onError,
              alignment: TextAlign.start,
            ))));
  }

  Widget _buildLoading(OnBoardingSupplements supp) {
    return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primary))));
  }

  Widget _buildContent(OnBoardingSupplements supp) {
    return Scaffold(
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
