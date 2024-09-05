import 'package:expense_tracker_v2/features/manager.dart';
import 'package:expense_tracker_v2/models/expense_category_add_data.dart';

import '../common_imports.dart';

class CategoryAddTab extends ConsumerStatefulWidget {
  const CategoryAddTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryAddPageState();
}

class _CategoryAddPageState extends ConsumerState<CategoryAddTab> {
  IconData? icon;
  final nameController = TextEditingController();
  final notesController = TextEditingController();

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
  }
}
