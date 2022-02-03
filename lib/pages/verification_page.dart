import '../source.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late final OnBoardingPageBloc bloc;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    bloc = Provider.of<OnBoardingPageBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Builder(builder: (parentScaffoldContext) {
        return BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
            bloc: bloc,
            /*    listenWhen: (previous, current) {
              final currentCondition = current.maybeWhen(
                  failed: (_, __) => false, orElse: () => true);
              final prevCondition = previous.maybeWhen(
                  failed: (_, __) => true, orElse: () => true);
              return currentCondition && prevCondition;
            }, */
            listener: (_, state) {
              final hasSucceded =
                  state.maybeWhen(success: (_) => true, orElse: () => false);

              final hasFailed =
                  state.maybeWhen(failed: (_, __) => true, orElse: () => false);

              if (hasSucceded) {
                AdditionalInfoPage.navigateTo(context);
              }

              if (hasFailed) {
                log('1'.toString());
                log('2'.toString());
                final message =
                    state.maybeWhen(failed: (_, m) => m, orElse: () => null);
                _showSnackBar(parentScaffoldContext, message!);
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
      }),
    );
  }

  _showSnackBar(BuildContext context, String message) {
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
          ),
        )));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  Widget _buildLoading(OnBoardingSupplements supp) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      width: ScreenSizeConfig.getFullWidth,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.primary)),
    );
  }

  Widget _buildContent(OnBoardingSupplements supp) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 20.dh),
        children: [
          _buildTitle(),
          _buildEmailDetails(),
          _buildTextFields(),
        ],
      ),
      bottomNavigationBar: _buildVerifyButton(),
    );
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
                height: 80.dh, fit: BoxFit.contain),
          ),
          SizedBox(height: 120.dh),
          AppText(
            'Verification page',
            size: 28.dw,
            family: kFontFam2,
          ),
          SizedBox(height: 10.dh),
          AppText(
            'We sent a mail containing OTP code.',
            size: 16.dw,
            color: AppColors.onBackground2,
          ),
        ],
      ),
    );
  }

  _buildEmailDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60.dh),
        AppText('Email address used:',
            size: 16.dw, color: AppColors.onBackground2),
        SizedBox(height: 5.dh),
        AppText('okellogerald126@gmail.com',
            size: 15.dw, color: AppColors.onBackground3),
        AppTextButton(
          onPressed: () => Navigator.pop(context),
          text: 'Change Email',
          margin: EdgeInsets.only(top: 10.dh),
          textColor: AppColors.primary,
          width: 100.dw,
        )
      ],
    );
  }

  _buildTextFields() {
    return Padding(
      padding: EdgeInsets.only(top: 60.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerificationTextField(
            id: 1,
            onChanged: bloc.updateOtp,
          ),
          VerificationTextField(
            id: 2,
            onChanged: bloc.updateOtp,
          ),
          VerificationTextField(
            id: 3,
            onChanged: bloc.updateOtp,
          ),
          VerificationTextField(
            id: 4,
            onChanged: bloc.updateOtp,
          ),
          VerificationTextField(
              id: 5, onChanged: bloc.updateOtp, hasNextFocus: false),
        ],
      ),
    );
  }

  _buildVerifyButton() {
    return AppTextButton(
      onPressed: bloc.verify,
      text: 'Verify',
      buttonColor: AppColors.primary,
      margin: EdgeInsets.only(bottom: 15.dh, left: 15.dw, right: 15.dw),
      height: 40.dh,
    );
  }
}
