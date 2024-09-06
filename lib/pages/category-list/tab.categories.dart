import 'package:expense_tracker_v2/features/categories/manager.dart';

import '../../components/category_tile.dart';
import '../common_imports.dart';

class CategoryListTab extends ConsumerStatefulWidget {
  const CategoryListTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryListTabState();
}

class _CategoryListTabState extends ConsumerState<CategoryListTab>
    with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    ref.read(categoriesManagerProvider).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Categories>(
        stream: ref.read(categoriesManagerProvider).categoriesStream,
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];
          return ListView.separated(
            padding: kHorPadding + top(),
            itemCount: data.length,
            itemBuilder: (_, i) =>
                AmountedCategoryTile(data[i].key, data[i].value),
            separatorBuilder: (_, i) => vSpace(2),
          );
        },
      ),
    );
  }
}
