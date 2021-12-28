import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'budget_page_state.freezed.dart';

@freezed
class BudgetPageState with _$BudgetPageState {
  const factory BudgetPageState.loading(List<Budget> budgetList) = _Loading;
  const factory BudgetPageState.content(List<Budget> budgetList) = _Content;

  factory BudgetPageState.initial() => const BudgetPageState.content([]);
}