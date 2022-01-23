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
    bloc.init();
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
                    MaterialPageRoute(builder: (_) => const RecordsPage()));
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
        _buildPicture(supp),
        _buildNameTextfield(),
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
            'Complete the onboarding process with filling details below.',
            size: 16.dw,
            color: AppColors.onBackground2,
          ),
        ],
      ),
    );
  }

  _buildPicture(OnBoardingSupplements supp) {
    final image = supp.user.photoUrl;
    return Column(
      children: [
        SizedBox(height: 40.dh),
        Stack(
          children: [
            CircleAvatar(
              radius: 70.dw,
              backgroundColor: AppColors.surface,
              backgroundImage:
                  NetworkImage(image.isEmpty ? kDefaultPhotoUrl : image),
            ),
            Positioned(
                right: 10.dw,
                bottom: 10.dw,
                child: AppIconButton(
                  icon: Icons.add_a_photo,
                  iconColor: AppColors.primary,
                  onPressed: () {},
                  iconSize: 30.dw,
                ))
          ],
        )
      ],
    );
  }

  _buildNameTextfield() {
    return Column(
      children: [
        SizedBox(height: 40.dh),
        AppTextField(
          errors: const {},
          text: '',
          onChanged: (_) {},
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
            height: 290.dh,
            child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(10.dw),
                children: codePointList.map((e) {
                  final formatted = '0xe' + e.toString();
                  final codePoint = int.parse(formatted);
                  log(formatted);

                  return GestureDetector(
                    //onTap: () => bloc.updatecodePoint(codePoint),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.0),
                            border: Border.all(color: Colors.transparent)),
                        child: Icon(
                          CurrencyIcons.getIcon(codePoint),
                          color: AppColors.onBackground2,
                        )),
                  );
                }).toList())),
      ],
    );
  }

  _buildDoneTextField() {
    return AppTextButton(
      onPressed: () {},
      buttonColor: AppColors.primary,
      text: 'Done',
      height: 40.dh,
      margin: EdgeInsets.only(top: 20.dh),
    );
  }
}
