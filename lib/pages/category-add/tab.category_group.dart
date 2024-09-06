import '../../features/manager.dart';
import '../../models/expense_group_add_data.dart';

import '../common_imports.dart';

class GroupAddTab extends ConsumerStatefulWidget {
  final VoidCallback onDone;
  const GroupAddTab({required this.onDone, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<GroupAddTab> {
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

    final data = ExpenseGroupAddData(
      name: nameController.compactText!,
      notes: notesController.compactText,
    );

    ref.read(expensesManagerProvider).addGroup(data);
    widget.onDone();
  }
}
