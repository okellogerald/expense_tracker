import 'package:expense_tracker_v2/features/realm_core.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/pages/common_imports.dart';
import 'package:realm/realm.dart';

typedef Groups = List<MapEntry<ExpenseGroup, double>>;

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

  final _controller = StreamController<Groups>.broadcast();
  Stream<Groups> get groupsStream => _controller.stream;

  void refresh() {
    _load();
  }

  void _load() {
    final groups = super.getAll<ExpenseGroup>();
    final expenses = super.getAll<Expense>();

    final Groups entries = [];

    for (var g in groups) {
      final list = expenses.where((e) => e.category?.group == g);
      final total = list.fold(0.0, (prev, e) => prev + e.amount);
      final entry = MapEntry(g, total);
      entries.add(entry);
    }

    _controller.add(entries);
  }
}
