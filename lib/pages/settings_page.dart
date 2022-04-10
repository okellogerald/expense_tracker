import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_details_provider.dart';
import '../providers/user_notifier.dart';
import '../source.dart';
import '../states/user_state.dart';
import '../utils/navigation_logic.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final isSelectingBackupOptionNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      next!.maybeWhen(
          done: () => push(const MainPage()),
          failed: (message) => showSnackBar(message, context: context),
          orElse: () {});
    });

    return Scaffold(
      appBar: _buildAppBar(),
      body: userState.maybeWhen(
          loading: (message) => AppLoadingIndicator(message),
          orElse: () {
            return Padding(
              padding: EdgeInsets.fromLTRB(15.dw, 10.dw, 15.dw, 0),
              child: Column(
                children: [
                  _buildUserAccount(),
                  _buildBackupOptions(),
                  _buildSignOutButton(),
                ],
              ),
            );
          }),
    );
  }

  _buildUserAccount() {
    final user = ref.watch(userDetailsProvider);

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

  _buildBackupOptions() {
    final user = ref.watch(userDetailsProvider);

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
                    ),
              !isSelectingBackupOption &&
                      user.backUpOption == BackUpOptions.on_button_tap
                  ? _buildBackUpButton()
                  : Container(),
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
            onPressed: () {},
            padding: EdgeInsets.only(left: 10.dw),
            text: backupOptions[index],
            textColor:
                isSelected ? AppColors.onBackground : AppColors.onBackground2,
            height: 40.dh,
            buttonColor: isSelected ? AppColors.accent : AppColors.background,
            alignment: Alignment.centerLeft);
      },
    );
  }

  _buildBackUpButton() {
    return AppTextButton(
      onPressed: () {},
      text: 'Back up now',
      icon: Icons.backup,
      withIcon: true,
      buttonColor: AppColors.secondary,
      iconColor: AppColors.primary,
      height: 40.dh,
      margin: EdgeInsets.only(top: 20.dh),
    );
  }

  _buildSignOutButton() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppTextButton(
            onPressed: ref.read(userNotifierProvider.notifier).signOut,
            text: 'Sign out',
            icon: Icons.logout,
            withIcon: true,
            buttonColor: AppColors.secondary,
            iconColor: AppColors.primary,
            height: 40.dh,
            margin: EdgeInsets.only(bottom: 20.dh),
          ),
        ],
      ),
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
