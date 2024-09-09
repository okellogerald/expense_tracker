import 'package:expense_tracker_v2/features/realm_core.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/pages/common_imports.dart';
import 'package:realm/realm.dart';

import '../../models/expense_group_add_data.dart';

typedef AmountedGroup = MapEntry<ExpenseGroup, double>;
typedef AmountedGroups = List<AmountedGroup>;
typedef Groups = List<ExpenseGroup>;

final groupsManagerProvider = Provider((_) => _GroupsManager());

final class _GroupsManager extends RealmCore {
  _GroupsManager() {
    final config = Configuration.local(
      [
        Expense.schema,
        ExpenseGroup.schema,
        ExpenseCategory.schema,
      ],
      // shouldDeleteIfMigrationNeeded: true,
    );
    super.init(config);
    _load();
  }

  var _groups = <ExpenseGroup>[];
  var _amountedGroups = <AmountedGroup>[];

  final _controller = StreamController<AmountedGroups>.broadcast();
  Stream<AmountedGroups> get amountedGroupsStream => _controller.stream;

  Stream<Groups> get groupsStream => getReactiveList<ExpenseGroup>();

  Groups get groups => _groups;
  AmountedGroups get amountedGroups => _amountedGroups;

  void refresh() {
    _load();
  }

  void _load() {
    final groups = super.getAll<ExpenseGroup>();
    final expenses = super.getAll<Expense>();

    final AmountedGroups entries = [];

    for (var g in groups) {
      final list = expenses.where((e) => e.category?.group == g);
      final total = list.fold(0.0, (prev, e) => prev + e.amount);
      final entry = MapEntry(g, total);
      entries.add(entry);
    }

    _controller.add(entries);
    _groups = groups;
    _amountedGroups = entries;
  }

  ExpenseGroup addGroup(ExpenseGroupAddData data) {
    final input = ExpenseGroup(
      ObjectId(),
      data.name,
      notes: data.notes,
    );

    final group = add(input);

    _load();

    return group;
  }

  ExpenseGroup editGroup(ObjectId groupid, ExpenseGroupAddData data) {
    final input = ExpenseGroup(
      groupid,
      data.name,
      notes: data.notes,
    );

    final group = edit(input);

    _load();

    return group;
  }
}
