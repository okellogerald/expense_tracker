import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'freezed_models/budget_page_supplements.freezed.dart';

@freezed
class BudgetPageSupplements with _$BudgetPageSupplements {
  const factory BudgetPageSupplements({
    required List<Budget> budgetList,
    required String id,
    required Map<String, Map<String, int>> dailyBudgetMap,
  }) = _BudgetPageSupplements;

  factory BudgetPageSupplements.empty() =>
      const BudgetPageSupplements(budgetList: [], id: '', dailyBudgetMap: {});
}
