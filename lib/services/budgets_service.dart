import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../source.dart';

class BudgetsService {
  final _budgetsBox = Hive.box(kBudgets);
  final uuid = const Uuid();

  List<Budget> getBudgets() {
    if (_budgetsBox.isEmpty) return [];
    final values = _budgetsBox.values;
    final budgetList = <Budget>[];
    for (Budget budget in values) {
      budgetList.add(budget);
    }
    return budgetList;
  }

  void add(Category category, double amount, int duration) {
    final id = uuid.v4();
    final budget =
        Budget(amount: amount, category: category, id: id, duration: duration);
    _budgetsBox.put(id, budget);
  }
}
