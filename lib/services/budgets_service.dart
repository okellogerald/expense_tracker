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

  void edit(String id, double amount) {
    final budget = _budgetsBox.get(id) as Budget;
    final updatedBudget = budget.copyWith(amount: amount);
    _budgetsBox.put(id, updatedBudget);
    final index = _budgetList.indexWhere((e) => e.id == id);
    _budgetList[index] = updatedBudget;
    controller.add(_budgetList);
  }

  void delete(String id) {
    _budgetsBox.delete(id);
    final index = _budgetList.indexWhere((e) => e.id == id);
    _budgetList.removeAt(index);
    controller.add(_budgetList);
  }

  void editSimilarCategories(Category category) {
    final budgetList =
        _budgetList.where((e) => e.category.id == category.id).toList();
    for (Budget budget in budgetList) {
      final id = budget.category.id;
      final index = budgetList.indexWhere((e) => e.category.id == id);
      final updatedBudget = budget.copyWith(category: category);
      _budgetList[index] = updatedBudget;
      _budgetsBox.put(budget.id, updatedBudget);
    }
  }

  ///checking if the category is already budgetted for
  ///returns [true] if budget for this category already exists
  bool isExisting(String categoryId) {
    final list = _budgetList.where((e) => e.category.id == categoryId).toList();
    return list.isNotEmpty;
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
