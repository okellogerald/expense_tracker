import 'package:budgetting_app/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplements.freezed.dart';

@freezed
class Supplements with _$Supplements {
  const factory Supplements({
    @Default('-1') String id,
    @Default('') String title,
    @Default(false) bool isEditing,
    @Default(kIncome) String type,
    @Default(-1) int codePoint,
    @Default(AddCategoryWidgetPosition.top) AddCategoryWidgetPosition position,
    @Default({}) Map<String, dynamic> errors,
  }) = _Supplements;
}
