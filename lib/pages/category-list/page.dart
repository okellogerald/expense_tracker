import 'package:expense_tracker_v2/components/category_tile.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/pages/category-add/page.dart';

import '../../features/manager.dart';
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
      body: StreamBuilder<List<ExpenseCategory>>(
          stream: ref.read(expensesManagerProvider).categoriesStream,
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            return ListView.separated(
              padding: kHorPadding,
              itemCount: data.length,
              itemBuilder: (_, i) => CategoryTile(data[i]),
              separatorBuilder: (_, i) => vSpace(2),
            );
          }),
    );
  }
}
