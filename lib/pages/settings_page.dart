import '../source.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SettingsPage()));

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = themeProvider.getCurrentTheme;

    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15.dw, 10.dw, 15.dw, 0),
        children: [
          AppText('Theme', size: 18.dw, family: kFontFam2),
          SizedBox(height: 10.dh),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OptionCircle(
                  onTap: () {}, isSelected: false, option: 'System Theme'),
              OptionCircle(
                  onTap: () => themeProvider.changeThemeTo('Light'),
                  isSelected: currentTheme == 'Light',
                  option: 'Light Theme'),
              OptionCircle(
                  onTap: () => themeProvider.changeThemeTo('Dark'),
                  isSelected: currentTheme == 'Dark',
                  option: 'Dark Theme'),
            ],
          )
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: AppText('Preferences',
          size: 24.dw, family: kFontFam2, color: appColors.textColor),
      elevation: 0,
      backgroundColor: appColors.backgroundColor,
      leading: AppIconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icons.arrow_back,
        iconColor: appColors.iconColor,
      ),
    );
  }
}
