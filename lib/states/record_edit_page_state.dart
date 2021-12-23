import 'package:freezed_annotation/freezed_annotation.dart';

import '../source.dart';

part 'record_edit_page_state.freezed.dart';

@freezed
class RecordEditPageState with _$RecordEditPageState {
  const factory RecordEditPageState.loading(List<Category> categoryList, Category category, RecordEditPageForm form) = _Loading;
  const factory RecordEditPageState.content(List<Category> categoryList, Category category, RecordEditPageForm form) = _Content;
  const factory RecordEditPageState.success(List<Category> categoryList, Category category, RecordEditPageForm form) = _Success;

  factory RecordEditPageState.initial() => RecordEditPageState.content([], Category(), RecordEditPageForm(date: DateTime.now()));
}
