import '../source.dart';
import '../utils/navigation_logic.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

final mainPageScaffoldKey = GlobalKey<ScaffoldState>();

class _MainPageState extends State<MainPage> {
  var _currentBottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitAppDialog(context),
      child: Scaffold(
          key: mainPageScaffoldKey,
          body: _getCurrentPage(),
          bottomNavigationBar: _buildBottomNavigationBar()),
    );
  }

  Widget _getCurrentPage() {
    switch (_currentBottomNavBarIndex) {
      case 0:
        return const RecordsPage();
      case 1:
        return const CategoriesPage();
      case 2:
        return const BudgetPage();
      case 3:
        return const ReportsPage();
    }
    return Container();
  }

  _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.onBackground2))),
      child: BottomNavigationBar(
        currentIndex: _currentBottomNavBarIndex,
        onTap: _updateIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Records'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Budgets'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Reports')
        ],
      ),
    );
  }

  void _updateIndex(int index) {
    _currentBottomNavBarIndex = index;
    setState(() {});
  }
}
