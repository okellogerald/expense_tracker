import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'generated/budget_page_state.freezed.dart';

@freezed
class BudgetPageState with _$BudgetPageState {
  const factory BudgetPageState.loading(BudgetPageSupplements supp) = _Loading;
  const factory BudgetPageState.content(BudgetPageSupplements supp) = _Content;

  factory BudgetPageState.initial() =>
      BudgetPageState.content(BudgetPageSupplements.empty());
}
