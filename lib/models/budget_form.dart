import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_form.freezed.dart';

@freezed
class BudgetForm with _$BudgetForm {
 const factory BudgetForm({
   @Default(0) int duration,
   @Default(0) double amount,
   @Default(false) bool isUsingCustomDuration,
   @Default({}) Map<String, dynamic> errors,
   @Default({}) Map<String, double> values,
  }) = _BudgetForm;
}