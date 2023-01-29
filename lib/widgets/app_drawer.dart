import 'package:budgetting_app/pages/account_page.dart';
import 'package:budgetting_app/pages/backup_page.dart';
import 'package:budgetting_app/pages/goals_page.dart';
import 'package:budgetting_app/pages/income_page.dart';
import 'package:budgetting_app/source.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      width: ScreenSizeConfig.getFullWidth - 50.dw,
      child: Column(
        children: [
          _buildActions(),
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
}
