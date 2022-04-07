import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_form.freezed.dart';

@freezed
class BudgetForm with _$BudgetForm {
  const factory BudgetForm({
    @Default(0) int duration,
    @Default('-1') String id,
    @Default({}) Map<String, dynamic> errors,
    @Default({}) Map<String, String> values,
  }) = _BudgetForm;
}
