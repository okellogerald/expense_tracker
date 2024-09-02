import 'package:expense_tracker_v2/pages/category-list/page.dart';
import 'package:expense_tracker_v2/pages/expense-list/page.dart';

import '/pages/common_imports.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  static const routeName = "/";

  static void to() => router.pushReplacement(routeName);

  static Widget builder(BuildContext c, GoRouterState state) {
    return const MainPage();
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarIndex = ref.watch(_indexProvider);

    return Scaffold(
      body: IndexedStack(
        index: bottomNavBarIndex,
        children: const [
          ExpensesPage(),
          CategoriesPage(),
          Text("Hello world"),
          Text("Hello world"),
          Text("Hello world"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: updateBottomNavBarIndexTo,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layers),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.goal),
            label: 'Budgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.stickyNote),
            label: 'Notes',
          ),
        ],
      ),
    );
  }

  updateBottomNavBarIndexTo(int index) {
    ref.read(_indexProvider.notifier).state = index;
  }
}

final _indexProvider = StateProvider((_) => 0);
