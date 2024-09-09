import '/features/categories/manager.dart';

import '/components/category_tile.dart';
import '../common_imports.dart';

class CategoryListTab extends ConsumerStatefulWidget {
  const CategoryListTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryListTabState();
}

class _CategoryListTabState extends ConsumerState<CategoryListTab>
    with AfterLayoutMixin {
  AmountedCategories categories = [];

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final list = ref.read(categoriesManagerProvider).amountedCategories;
    updateCategories(list);

    ref.read(categoriesManagerProvider).onAmountedCategoriesChange.listen((l) {
      updateCategories(l);
    });
  }

  updateCategories(AmountedCategories list) {
    setState(() => categories = list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: kHorPadding + top(),
        itemCount: categories.length,
        itemBuilder: (_, i) => AmountedCategoryTile(
          categories[i].key,
          categories[i].value,
        ),
        separatorBuilder: (_, i) => vSpace(2),
      ),
    );
  }
}
