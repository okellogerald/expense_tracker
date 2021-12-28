import 'dart:async';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../source.dart';

class BudgetsService {
  final _budgetsBox = Hive.box(kBudgets);
  final uuid = const Uuid();
  static final _budgetList = <Budget>[];

  final controller = StreamController<List<Budget>>.broadcast();
  Stream<List<Budget>> get getBudgetListStream => controller.stream;

  List<Budget> getBudgets() {
    if (_budgetsBox.isEmpty) return [];
    final values = _budgetsBox.values;
    for (Budget budget in values) {
      final index = _budgetList.indexWhere((e) => e.id == budget.id);
      if (index == -1) _budgetList.add(budget);
    }
    return _budgetList;
  }

  void add(Category category, double amount, int duration) {
    final id = uuid.v4();
    final budget =
        Budget(amount: amount, category: category, id: id, duration: duration);
    _budgetsBox.put(id, budget);
    _budgetList.add(budget);
    controller.add(_budgetList);
  }

  void editSimilarCategories(Category category) {
    final budgetList =
        _budgetList.where((e) => e.category.id == category.id).toList();
    for (Budget budget in budgetList) {
      final id = budget.category.id;
      final index = budgetList.indexWhere((e) => e.category.id == id);
      final _updatedBudget = budget.copyWith(category: category);
      _budgetList[index] = _updatedBudget;
      _budgetsBox.put(budget.id, _updatedBudget);
    }
  }

  bool isExisting(int duration, String id) {
    final list = _budgetList.where((e) => e.duration == duration).toList();
    if (list.isEmpty) return false;
    return list.first.category.id == id;
  }

  List<String> getCategoryIds() {
    final idList = <String>[];
    for (Budget budget in _budgetList) {
      final id = budget.category.id;
      idList.add(id);
    }
    return idList;
  }
}
