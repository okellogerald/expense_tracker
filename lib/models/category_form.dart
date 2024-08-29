import 'package:expense_tracker/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_form.freezed.dart';

@freezed
class CategoryForm with _$CategoryForm {
  const factory CategoryForm({
    @Default('-1') String id,
    @Default('') String title,
    @Default(false) bool isEditing,
    @Default(kIncome) String type,
    @Default(-1) int codePoint,
    @Default({}) Map<String, dynamic> errors,
    @Default([]) List<String> undeletableCategories,
  }) = _CategoryForm;
}
