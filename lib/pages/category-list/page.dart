import '/pages/category-list/tab.categories.dart';

import '../category-add/page.dart';
import '../common_imports.dart';
import 'tab.groups.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppText("Categories"),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: CategoryAddPage.to,
          child: Icon(LucideIcons.plus),
        ),
        body: Column(
          children: [
            TabBar.secondary(
              controller: tabController,
              tabs: const [
                Tab(text: "Categories"),
                Tab(text: "Groups"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  CategoryListTab(),
                  GroupListTab(),
                ],
              ),
            )
          ],
        ));
  }
}
