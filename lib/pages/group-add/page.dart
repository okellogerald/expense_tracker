import '/features/groups/manager.dart';

import '/models/expense_group_add_data.dart';

import '../common_imports.dart';

class GroupAddPage extends ConsumerStatefulWidget {
  const GroupAddPage({super.key});

  static const routeName = "/group-add";

  static Future<ExpenseGroup?> to() => router.push<ExpenseGroup>(routeName);

  static void pop([ExpenseGroup? group]) => router.pop(group);

  static Widget builder(BuildContext c, GoRouterState state) {
    return const GroupAddPage();
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<GroupAddPage> {
  IconData? icon;
  final nameController = TextEditingController();
  final notesController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const AppText("Add Group"),
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

    final g = ref.read(groupsManagerProvider).addGroup(data);
    GroupAddPage.pop(g);
  }
}
