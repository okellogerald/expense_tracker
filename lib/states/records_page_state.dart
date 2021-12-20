import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'records_page_state.freezed.dart';

@freezed
class RecordsPageState with _$RecordsPageState {
  const factory RecordsPageState.loading(
      List<Record> recordList, RecordsPageSupplements supplements) = _Loading;
  const factory RecordsPageState.content(
      List<Record> recordList, RecordsPageSupplements supplements) = _Content;
  const factory RecordsPageState.success(
      List<Record> recordList, RecordsPageSupplements supplements) = _Success;

  factory RecordsPageState.initial() => RecordsPageState.content(
      [],
      RecordsPageSupplements(
          category: Category.empty(), totalRecords: TotalRecords()));
}
