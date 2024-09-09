import '/components/category-icon-pick/page.dart';
import '/features/categories/manager.dart';
import '/models/expense_category_add_data.dart';
import '/models/realm/expense.category.dart';
import '/pages/group-select/page.dart';

import '../common_imports.dart';

class CategoryAddPage extends ConsumerStatefulWidget {
  const CategoryAddPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();

  static const routeName = "/category-add";

  static Future<ExpenseCategory?> to() =>
      router.push<ExpenseCategory>(routeName);

  static void pop([ExpenseCategory? c]) => router.pop(c);

  static Widget builder(BuildContext c, GoRouterState state) {
    return const CategoryAddPage();
  }
}

class _State extends ConsumerState<CategoryAddPage> {
  IconData? icon;
  final nameController = TextEditingController();
  final notesController = TextEditingController();

  ExpenseGroup? group;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const AppText("Add Category"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: kHorPadding + top(),
            children: [
              OverflowBar(
                overflowSpacing: kVSpace,
                children: [
                  TemboTextField.labelled(
                    "Name",
                    controller: nameController,
                  ),
                  AppSelectButton<IconData>(
                    icon,
                    title: "Category Icon",
                    child: (value) => Icon(value),
                    onPress: selectIcon,
                    placeholder: "Select Icon",
                  ),
                  AppSelectButton<ExpenseGroup>(
                    group,
                    title: "Group",
                    label: (g) => g.name,
                    onPress: selectGroup,
                    placeholder: "Select Group",
                  ),
                  TemboTextField.labelled(
                    "Notes",
                    controller: notesController,
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(
          onPress: save,
        ),
      ),
    );
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void selectGroup() async {
    final g = await GroupSelectPage.to(group);
    if (g != null) {
      setState(() {
        group = g;
      });
    }
  }

  void selectIcon() async {
    final i = await ExpenseCategoryIconSelectPage.to(icon);
    if (i != null) {
      setState(() => icon = i);
    }
  }

  void save() {
    final valid = validate();
    if (!valid) return;

    final data = ExpenseCategoryAddData(
      icon: icon,
      name: nameController.compactText!,
      notes: notesController.compactText,
    );

    final c = ref.read(categoriesManagerProvider).addCategory(data);
    CategoryAddPage.pop(c);
  }
}
