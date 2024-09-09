import '/features/groups/manager.dart';

import '../common_imports.dart';

class GroupListTab extends ConsumerStatefulWidget {
  const GroupListTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupListTabState();
}

class _GroupListTabState extends ConsumerState<GroupListTab>
    with AfterLayoutMixin {
  AmountedGroups groups = [];

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final list = ref.read(groupsManagerProvider).amountedGroups;
    updateGroups(list);

    ref.read(groupsManagerProvider).amountedGroupsStream.listen((l) {
      updateGroups(l);
    });
  }

  updateGroups(AmountedGroups list) {
    setState(() => groups = list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: kHorPadding + top(),
        itemCount: groups.length,
        itemBuilder: (_, i) => GroupTile(
          groups[i].key,
          amount: groups[i].value,
        ),
        separatorBuilder: (_, i) => vSpace(2),
      ),
    );
  }
}
