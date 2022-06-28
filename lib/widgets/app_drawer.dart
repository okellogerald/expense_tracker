import 'package:budgetting_app/pages/account_page.dart';
import 'package:budgetting_app/pages/backup_page.dart';
import 'package:budgetting_app/pages/goals_page.dart';
import 'package:budgetting_app/pages/income_page.dart';
import 'package:budgetting_app/providers/onboarding/user_details_provider.dart';
import 'package:budgetting_app/providers/onboarding/user_notifier.dart';
import 'package:budgetting_app/source.dart';
import 'package:budgetting_app/states/user_state.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_divider.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      width: ScreenSizeConfig.getFullWidth - 50.dw,
      child: Column(
        children: [
          _buildUser(),
          _buildActions(),
          _buildLogOutButton(),
        ],
      ),
    );
  }

  _buildUser() {
    //~ avoiding null-check errors during sign out
    final user = ref.watch(signedInUserProvider) ?? const User();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 10.dh),
      margin: EdgeInsets.only(
          left: 15.dw, right: 15.dw, top: 50.dh, bottom: 100.dh),
      child: Column(
        children: [
          user.photoUrl.isEmpty
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.dw,
                  child: Icon(Icons.person, size: 80.dw),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.photoUrl), radius: 80.dw),
          SizedBox(height: 20.dh),
          AppText(user.displayName),
          SizedBox(height: 20.dh),
          const AppDivider()
        ],
      ),
    );
  }

  _buildActions() {
    return Column(
      children: [
        _buildAction('Account', const AccountPage()),
        _buildAction('Goals', const GoalsPage()),
        _buildAction('Expected Income', const IncomePage()),
        _buildAction('Back-up', const BackUpPage()),
      ],
    );
  }

  _buildAction(String title, Widget nextPage) {
    return AppTextButton(
      onPressed: () => push(nextPage),
      height: 50.dh,
      child: AppText(title, size: 15.dw),
      margin: EdgeInsets.only(left: 15.dw, right: 15.dw),
    );
  }

  _buildLogOutButton() {
    final userNotifier = ref.watch(userNotifierProvider);

    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      next!.maybeWhen(
          done: () {
            pop();
            pushAndRemoveUntil(const LoginPage());
            showSnackBar('Logged out successfully',
                context: context, isError: false);
          },
          failed: (message) {
            pop();
            showSnackBar(message, context: context);
          },
          orElse: () {});
    });

    return userNotifier.maybeWhen(
        loading: (_) => _buildButton(true), orElse: _buildButton);
  }

  _buildButton([bool isLoading = false]) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AppTextButton(
          onPressed: ref.read(userNotifierProvider.notifier).signOut,
          height: 50.dh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                SizedBox(
                    width: 20.dw,
                    height: 20.dw,
                    child: const CircularProgressIndicator(strokeWidth: 3)),
              if (isLoading) SizedBox(width: 25.dw),
              AppText('Sign out',
                  color: AppColors.onSecondary,
                  size: 15.dw,
                  weight: FontWeight.bold)
            ],
          ),
          margin: EdgeInsets.only(bottom: 10.dh, left: 15.dw, right: 15.dw),
          buttonColor: AppColors.onBackground.withOpacity(.7),
        ),
      ),
    );
  }
}
