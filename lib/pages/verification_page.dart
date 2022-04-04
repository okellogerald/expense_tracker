import '../source.dart';
import '../utils/navigation_logic.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage(this.email, {Key? key}) : super(key: key);

  final String email;

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late final OnBoardingPageBloc bloc;

  @override
  void initState() {
    final userService = Provider.of<UserService>(context, listen: false);
    bloc = OnBoardingPageBloc(userService);
    bloc.init(Pages.verification_page, email: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (scaffoldContext) {
      return BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
          bloc: bloc,
          listener: (_, state) {
            final hasSucceeded =
                state.maybeWhen(success: (_) => true, orElse: () => false);
            if (hasSucceeded) push(const AdditionalInfoPage());

            final error = state.maybeWhen(
                failed: (_, error) => error, orElse: () => null);
            if (error != null) showSnackBar(error, context: scaffoldContext);
          },
          builder: (_, state) {
            return state.when(
                loading: _buildLoading,
                content: _buildContent,
                success: _buildContent,
                failed: (supp, _) => _buildContent(supp));
          });
    }));
  }

  Widget _buildLoading(OnBoardingSupplements supp) =>
      const AppLoadingIndicator.withScaffold();

  Widget _buildContent(OnBoardingSupplements supp) {
    return Scaffold(
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 50.dh),
      AppText('Email address used:',
          size: 16.dw, color: AppColors.onBackground2),
      SizedBox(height: 10.dh),
      AppText(widget.email, size: 15.dw, color: AppColors.onBackground3),
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
        onPressed: bloc.checkEmailVerificationStatus,
        text: 'I AM ALREADY VERIFIED',
        buttonColor: AppColors.onBackground,
        margin: EdgeInsets.only(bottom: 20.dh, left: 15.dw, right: 15.dw),
        height: 50.dh);
  }
}
