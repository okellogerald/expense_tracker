import '../source.dart';

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({Key? key, this.user}) : super(key: key);

  final User? user;

  static void navigateTo(BuildContext context, {User? user}) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AdditionalInfoPage(user: user)));

  @override
  _AdditionalInfoPageState createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  late final OnBoardingPageBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<OnBoardingPageBloc>(context, listen: false);
    bloc.init(user: widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<OnBoardingPageBloc, OnBoardingPageState>(
            bloc: bloc,
            listener: (_, state) {
              final hasSucceded =
                  state.maybeWhen(success: (_) => true, orElse: () => false);

              final hasFailed =
                  state.maybeWhen(failed: (_, __) => true, orElse: () => false);

              if (hasSucceded) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MainPage()));
              }

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
            }));
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
          ),
        )));
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
    return ListView(
      padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 20.dh),
      children: [
        _buildTitle(),
        _buildNameTextfield(supp),
        _buildCurrencyIcons(supp),
        _buildDoneTextField(),
      ],
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
            child: Image.network(kCompleteImageUrl,
                height: 80.dh, fit: BoxFit.contain),
          ),
          SizedBox(height: 120.dh),
          AppText(
            'One final step',
            size: 28.dw,
            family: kFontFam2,
          ),
          SizedBox(height: 10.dh),
          AppText(
            'Complete the onboarding process by filling the details below.',
            size: 16.dw,
            color: AppColors.onBackground2,
          ),
        ],
      ),
    );
  }

  _buildNameTextfield(OnBoardingSupplements supp) {
    return Column(
      children: [
        SizedBox(height: 40.dh),
        AppTextField(
          errors: const {},
          text: supp.user.displayName,
          onChanged: bloc.updateName,
          hintText: 'Username',
          keyboardType: TextInputType.name,
          errorName: 'username',
        )
      ],
    );
  }

  _buildCurrencyIcons(OnBoardingSupplements supp) {
    final codePointList = IconCodePointGenerator.currencyIconscodePointList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.dh),
        AppText(
          'Choose your currency:',
          size: 16.dw,
          color: AppColors.onBackground2,
        ),
        SizedBox(height: 10.dh),
        Container(
            color: AppColors.surface,
            height: 200.dh,
            width: ScreenSizeConfig.getFullWidth,
            child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: .9.dw,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(10.dw),
                children: codePointList.map((e) {
                  final formatted = '0xe' + e.toString();
                  final codePoint = int.parse(formatted);
                  final isSelected = codePoint == supp.currency;

                  return GestureDetector(
                    onTap: () => bloc.updateCodePoint(codePoint),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.0),
                            border: Border.all(
                                color: isSelected
                                    ? AppColors.accent
                                    : Colors.transparent)),
                        child: Icon(
                          CurrencyIcons.getIcon(codePoint),
                          color: AppColors.onBackground2,
                        )),
                  );
                }).toList())),
        supp.errors['currency'] != null
            ? Padding(
                padding: EdgeInsets.only(top: 8.dh),
                child: AppText(
                  supp.errors['currency']!,
                  size: 14.dw,
                  color: AppColors.accent,
                ),
              )
            : Container(),
      ],
    );
  }

  _buildDoneTextField() {
    return AppTextButton(
      onPressed: bloc.updateUser,
      buttonColor: AppColors.primary,
      text: 'Done',
      height: 40.dh,
      margin: EdgeInsets.only(top: 40.dh),
    );
  }
}
