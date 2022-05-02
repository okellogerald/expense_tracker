import 'package:budgetting_app/widgets/app_divider.dart';
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
          done: () {
            pushAndRemoveUntil(const LoginPage());
            showSnackBar('You have been logged out successfully',
                context: context, isError: false);
          },
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
                    children: [_buildUserAccount(), _buildSignOutButton()]));
          }),
    );
  }

  _buildUserAccount() {
    //~ avoiding null-check errors during sign out
    final user = ref.watch(signedInUserProvider) ?? const User();

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 10.dh),
        margin: EdgeInsets.only(bottom: 10.dh),
        decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(15.dw)),
        child: Column(children: [
          Row(children: [
            user.photoUrl.isEmpty
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.dw,
                    child: Icon(Icons.person, size: 30.dw),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl),
                    radius: 30.dw),
            SizedBox(width: 25.dw),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  AppText(user.displayName, size: 16.dw),
                  SizedBox(height: 5.dh),
                  AppText('Currency: ${user.currency}', size: 14.dw)
                ]))
          ]),
          AppDivider(margin: EdgeInsets.symmetric(vertical: 10.dh)),
          AppTextButton(
              onPressed: () {},
              text: 'Account Settings',
              textColor: AppColors.primary,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5.dh))
        ]));
  }

  _buildSignOutButton() {
    return AppTextButton(
        onPressed: ref.read(userNotifierProvider.notifier).signOut,
        text: 'Sign out',
        icon: Icons.logout,
        withIcon: true,
        isBolded: true,
        buttonColor: AppColors.primary,
        iconColor: AppColors.onPrimary,
        height: 40.dh,
        margin: EdgeInsets.only(top: 20.dh));
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
        ));
  }
}
