import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'budget_edit_page_state.freezed.dart';

@freezed
class BudgetEditPageState with _$BudgetEditPageState {
  const factory BudgetEditPageState.loading(List<Category> categoryList, List<String> idList, BudgetForm form) = _Loading;
  const factory BudgetEditPageState.content(List<Category> categoryList, List<String> idList, BudgetForm form) = _Content;
  const factory BudgetEditPageState.success(List<Category> categoryList, List<String> idList, BudgetForm form) = _Success;

  factory  BudgetEditPageState.initial() => const BudgetEditPageState.content([], [], BudgetForm());
}

class BudgetEditingPageState {
  BudgetEditingPageState._();

  factory BudgetEditingPageState.loading() => BudgetEditingPageState._();
  factory BudgetEditingPageState.content() => BudgetEditingPageState._();
  factory BudgetEditingPageState.success() => BudgetEditingPageState._();
}
