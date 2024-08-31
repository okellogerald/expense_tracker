import 'package:expense_tracker_v2/pages/category-add/page.dart';

import '../common_imports.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
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
      body: ListView(
        padding: kHorPadding,
        children: const [],
      ),
    );
  }
}
