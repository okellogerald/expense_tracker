import 'package:expense_tracker_v2/features/manager.dart';

import '../common_imports.dart';

class GroupSelectPage extends ConsumerStatefulWidget {
  final ExpenseGroup? current;
  const GroupSelectPage({this.current, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();

  static const routeName = "/group-select";

  static Future<ExpenseGroup?> to([ExpenseGroup? group]) =>
      router.push<ExpenseGroup>(routeName, extra: group);

  /// if you knew how to come to this page, then you know how to leave it
  static void pop([ExpenseGroup? c]) => router.pop(c);

  static Widget builder(BuildContext c, GoRouterState state) {
    ExpenseGroup? group;
    try {
      group = state.extra as ExpenseGroup;
    } catch (_) {}
    return GroupSelectPage(current: group);
  }
}

class _State extends ConsumerState<GroupSelectPage> with AfterLayoutMixin {
  var groups = <ExpenseGroup>[];
  ExpenseGroup? group;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    groups = ref.read(expensesManagerProvider).getExpenseGroups();
    group = widget.current;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Select Group"),
      ),
      bottomNavigationBar: BottomButton(
        onPress: done,
      ),
      body: ListView.separated(
        padding: kHorPadding + top(),
        itemCount: groups.length,
        itemBuilder: (_, i) => AppSelectTile(
          value: groups[i],
          label: (p0) => p0.name,
          onSelect: (value) => setState(() {
            group = value;
          }),
          selected: (p0) => p0.id == group?.id,
        ),
        separatorBuilder: (_, __) => vSpace(),
      ),
    );
  }

  void done() {
    GroupSelectPage.pop(group);
  }
}
