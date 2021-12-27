import '../source.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static final bottomBarCurrentIndexNotifier = ValueNotifier<int>(0);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
      body: ValueListenableBuilder<int>(
          valueListenable: Homepage.bottomBarCurrentIndexNotifier,
          builder: (context, index, child) {
            if (index == 0) return const RecordsPage();
            if (index == 1) return const CategoriesPage();
            return const BudgetPage();
          }),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  _buildBottomNavBar() {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: appColors.dividerColor))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _bottonNavBarItem(Icons.notes, 'Records', 0),
          _bottonNavBarItem(Icons.category, 'Categories', 1),
          _bottonNavBarItem(Icons.calculate, 'Budgets', 2),
          _bottonNavBarItem(Icons.insights, 'Reports', 3),
        ]));
  }

  _bottonNavBarItem(IconData icon, String text, int index) {
    return Builder(builder: (context) {
      final deviceWidth = MediaQuery.of(context).size.width;
      return GestureDetector(
        onTap: () => Homepage.bottomBarCurrentIndexNotifier.value = index,
        child: Container(
          width: deviceWidth / 4,
          color: Colors.white.withOpacity(.0),
          child: ValueListenableBuilder<int>(
              valueListenable: Homepage.bottomBarCurrentIndexNotifier,
              builder: (context, currentIndex, child) {
                final isActive = currentIndex == index;
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon,
                          size: 22,
                          color: isActive
                              ? appColors.primaryColor
                              : appColors.iconColor),
                      SizedBox(height: 5.dw),
                      AppText(
                        text,
                        color: isActive
                            ? appColors.primaryColor
                            : appColors.iconColor,
                        size: 14.dw,
                      )
                    ]);
              }),
        ),
      );
    });
  }
}
