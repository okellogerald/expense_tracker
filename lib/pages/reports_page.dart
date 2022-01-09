import '../source.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
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
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 40.dh),
        children: [
          _buildSectionTitle('Budgets Analysis'),
          _buildSectionTitle('Income Analysis'),
          _buildSectionTitle('Expenses Analysis'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.dw, vertical: 20.dh),
            child: const BarChart(),
          )
        ],
      ),
    );
  }

  _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 15.dw),
      child: Row(
        children: [
          AppIconButton(
            onPressed: () {},
            icon: Icons.add,
            iconColor: appColors.primaryColor,
          ),
          SizedBox(width: 10.dw),
          AppText(
            title.toUpperCase(),
            size: 15.dw,
            color: appColors.textColor,
          ),
          SizedBox(width: 5.dw),
          Expanded(child: Container(height: 2, color: appColors.dividerColor))
        ],
      ),
    );
  }
}
