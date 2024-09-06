import 'package:expense_tracker_v2/features/manager.dart';
import 'package:expense_tracker_v2/models/expense_category_add_data.dart';
import 'package:expense_tracker_v2/pages/group-select/page.dart';

import '../common_imports.dart';

class CategoryAddTab extends ConsumerStatefulWidget {
  final VoidCallback onDone;
  const CategoryAddTab({required this.onDone, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryAddPageState();
}

class _CategoryAddPageState extends ConsumerState<CategoryAddTab> {
  IconData? icon;
  final nameController = TextEditingController();
  final notesController = TextEditingController();

  ExpenseGroup? group;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: kHorPadding + top(),
            children: [
              OverflowBar(
                overflowSpacing: 15,
                children: [
                  TemboTextField.labelled(
                    "Name",
                    controller: nameController,
                  ),
                  CategoryIconPickButton(
                    label: "Category Icon",
                    onChange: (category) {
                      icon = category;
                    },
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

  void save() {
    final valid = validate();
    if (!valid) return;

    final data = ExpenseCategoryAddData(
      icon: icon,
      name: nameController.compactText!,
      notes: notesController.compactText,
    );

    ref.read(expensesManagerProvider).addCategory(data);
    widget.onDone();
  }
}
