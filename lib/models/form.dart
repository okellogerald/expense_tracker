import 'package:freezed_annotation/freezed_annotation.dart';

part 'form.freezed.dart';

@freezed
class RecordEditPageForm with _$RecordEditPageForm {
  const factory RecordEditPageForm({
    @Default(0) double amount,
    @Default('') String notes,
    @Default('') String id,
    required DateTime date,
    @Default({}) Map<String, dynamic> errors,
  }) = _RecordEditPageForm;
}
