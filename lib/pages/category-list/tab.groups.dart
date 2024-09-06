import 'package:expense_tracker_v2/features/groups/manager.dart';

import '../../features/manager.dart';
import '../common_imports.dart';

class GroupListTab extends ConsumerStatefulWidget {
  const GroupListTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupListTabState();
}

class _GroupListTabState extends ConsumerState<GroupListTab>
    with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    ref.read(groupsManagerProvider).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Groups>(
        stream: ref.read(groupsManagerProvider).groupsStream,
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];
          return ListView.separated(
            padding: kHorPadding + top(),
            itemCount: data.length,
            itemBuilder: (_, i) => GroupTile(
              data[i].key,
              amount: data[i].value,
            ),
            separatorBuilder: (_, i) => vSpace(2),
          );
        },
      ),
    );
  }
}
