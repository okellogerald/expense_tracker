import 'package:expense_tracker_v2/features/manager.dart';
import 'package:expense_tracker_v2/models/expense_category_add_data.dart';

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

class _CategoryAddPageState extends ConsumerState<CategoryAddPage> {
  IconData? icon;
  final nameController = TextEditingController();
  final notesController = TextEditingController();

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
            padding: kHorPadding,
            children: [
              OverflowBar(
                overflowSpacing: 15,
                children: [
                  CategoryIconPickButton(
                    label: "Category Icon",
                    onChange: (category) {
                      icon = category;
                    },
                  ),
                  TemboTextField.labelled(
                    "Name",
                    controller: nameController,
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

  void save() {
    final valid = validate();
    if (!valid) return;

    final data = ExpenseCategoryAddData(
      icon: icon,
      name: nameController.compactText!,
      notes: notesController.compactText,
    );

    ref.read(expensesManagerProvider).addCategory(data);
    CategoryAddPage.pop();
  }
}
