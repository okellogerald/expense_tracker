import '/features/categories/manager.dart';
import '/models/realm/expense.category.dart';
import '/pages/category-add/page.dart';

import '../common_imports.dart';

class CategorySelectPage extends ConsumerStatefulWidget {
  final ExpenseCategory? current;
  const CategorySelectPage({this.current, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();

  static const routeName = "/category-select";

  static Future<ExpenseCategory?> to([ExpenseCategory? category]) =>
      router.push<ExpenseCategory>(routeName, extra: category);

  /// if you knew how to come to this page, then you know how to leave it
  static void pop([ExpenseCategory? c]) => router.pop(c);

  static Widget builder(BuildContext c, GoRouterState state) {
    ExpenseCategory? category;
    try {
      category = state.extra as ExpenseCategory;
    } catch (_) {}
    return CategorySelectPage(
      current: category,
    );
  }
}

class _State extends ConsumerState<CategorySelectPage> with AfterLayoutMixin {
  var categories = <ExpenseCategory>[];
  ExpenseCategory? category;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    category = widget.current;
    categories = fetchAllCategories();
    setState(() {});
  }

  List<ExpenseCategory> fetchAllCategories() {
    return ref.read(categoriesManagerProvider).categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Select Category"),
        actions: [
          IconButton(onPressed: addCategory, icon: const Icon(LucideIcons.plus))
        ],
      ),
      bottomNavigationBar: BottomButton(
        onPress: done,
      ),
      body: ListView.separated(
        padding: kHorPadding + top(),
        itemCount: categories.length,
        itemBuilder: (_, i) => AppSelectTile(
          value: categories[i],
          label: (p0) => p0.name,
          onSelect: (value) => setState(() {
            category = value;
          }),
          selected: (p0) => p0.id == category?.id,
        ),
        separatorBuilder: (_, __) => vSpace(),
      ),
    );
  }

  void addCategory() async {
    final c = await CategoryAddPage.to();
    if (c != null) {
      setState(() {
        categories = fetchAllCategories();
        category = c;
      });
    }
  }

  void done() {
    CategorySelectPage.pop(category);
  }
}
