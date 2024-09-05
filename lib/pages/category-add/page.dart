import 'package:expense_tracker_v2/pages/category-add/tab.category_group.dart';
import 'package:expense_tracker_v2/pages/category-add/tab.expense_category.dart';

import '../common_imports.dart';

class CategoryAddPage extends ConsumerStatefulWidget {
  const CategoryAddPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryAddPageState();

  static const routeName = "/category-add";

  static void to() => router.push(routeName);

  static void pop() => router.pop();

  static Widget builder(BuildContext c, GoRouterState state) {
    return const CategoryAddPage();
  }
}

class _CategoryAddPageState extends ConsumerState<CategoryAddPage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Add Category"),
      ),
      body: Column(
        children: [
          TabBar.secondary(
            controller: controller,
            tabs: const [
              Tab(
                text: "Category",
              ),
              Tab(
                text: "Group",
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                CategoryAddTab(),
                GroupAddTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
