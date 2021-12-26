import '../source.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SettingsPage()));

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colors = AppColors(themeProvider.getCurrentTheme);

    return Scaffold(
      body: ListView(
        children: [
          AppText('Change app theme to', size: 16.dw),
          Row(
            children: [
              OptionCircle(
                  onTap: themeProvider.changeTheme,
                  isSelected: false,
                  option: 'System Theme'),
              OptionCircle(
                  onTap: () {}, isSelected: true, option: 'Light Theme'),
              OptionCircle(
                  onTap: () {}, isSelected: false, option: 'Dark Theme'),
            ],
          )
        ],
      ),
    );
  }
}
