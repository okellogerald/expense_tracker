import '../source.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SettingsPage()));

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final OnBoardingPageBloc bloc;
  final isSelectingBackupOptionNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    bloc = Provider.of(context, listen: false);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: BlocBuilder<OnBoardingPageBloc, OnBoardingPageState>(
            bloc: bloc,
            builder: (_, state) {
              return state.when(
                laoding: _buildLoading,
                content: _buildContent,
                success: _buildContent,
                failed: (supp, message) => _buildContent(supp),
              );
            }));
  }

  Widget _buildLoading(OnBoardingSupplements supp) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(OnBoardingSupplements supp) {
    return ListView(
      padding: EdgeInsets.fromLTRB(15.dw, 10.dw, 15.dw, 0),
      children: [
        _buildUserAccount(supp.user),
        _buildBackupOptions(supp.user),
      ],
    );
  }

  _buildUserAccount(User user) {
    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 10.dh),
      margin: EdgeInsets.only(bottom: 10.dh),
      child: Row(
        children: [
          user.photoUrl.isEmpty
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.dw,
                  child: Icon(Icons.person, size: 30.dw),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.photoUrl),
                  radius: 30.dw,
                ),
          SizedBox(width: 25.dw),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(user.displayName, size: 16.dw, family: kFontFam2),
              AppTextButton(
                onPressed: () {},
                text: 'Go to account settings',
                textColor: AppColors.primary,
                margin: EdgeInsets.only(top: 5.dh),
                alignment: Alignment.centerLeft,
                width: 170.dw,
              ),
            ],
          ))
        ],
      ),
    );
  }

  _buildBackupOptions(User user) {
    return ValueListenableBuilder<bool>(
        valueListenable: isSelectingBackupOptionNotifier,
        builder: (context, isSelectingBackupOption, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.dh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Backup Options', size: 20.dw),
                  AppIconButton(
                    onPressed: () => isSelectingBackupOptionNotifier.value =
                        !isSelectingBackupOptionNotifier.value,
                    icon: isSelectingBackupOption ? Icons.remove : Icons.add,
                    iconColor: AppColors.onBackground,
                  )
                ],
              ),
              isSelectingBackupOption
                  ? _buildBackUpOptionSelector(user)
                  : Padding(
                      padding: EdgeInsets.only(top: 8.dh),
                      child: AppText(user.backUpOption,
                          color: AppColors.accent, size: 15.dw),
                    )
            ],
          );
        });
  }

  _buildBackUpOptionSelector(User user) {
    final backupOptions = [
      BackUpOptions.never,
      BackUpOptions.daily,
      BackUpOptions.weekly,
      BackUpOptions.end_of_the_month,
      BackUpOptions.on_button_tap,
    ];

    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.dh),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        final option = backupOptions[index];
        final isSelected = user.backUpOption == option;

        return AppTextButton(
            onPressed: () => bloc.updateBackUpOption(option),
            padding: EdgeInsets.only(left: 10.dw),
            text: backupOptions[index],
            textColor:
                isSelected ? AppColors.onBackground : AppColors.onBackground3,
            height: 40.dh,
            buttonColor: isSelected ? AppColors.accent : AppColors.background,
            alignment: Alignment.centerLeft);
      },
    );
  }

  _buildAppBar() {
    return AppBar(
      title: AppText('Preferences',
          size: 24.dw, family: kFontFam2, color: AppColors.onBackground),
      elevation: 0,
      backgroundColor: AppColors.background,
      leading: AppIconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icons.arrow_back,
        iconColor: AppColors.onBackground,
      ),
    );
  }
}
