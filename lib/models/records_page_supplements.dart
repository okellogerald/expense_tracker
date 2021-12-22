import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'records_page_supplements.freezed.dart';

@freezed
class RecordsPageSupplements with _$RecordsPageSupplements {
  const RecordsPageSupplements._();

  const factory RecordsPageSupplements({
    required TotalRecords totalRecords,
    required Category category,
    required DateTime date,
    @Default(kIncome) type,
    @Default('-1') String id,
    @Default(0) double amount,
    @Default('') String notes,
    @Default([]) List<Category> categoryList,
    @Default({}) Map<String, dynamic> errors,
  }) = _RecordsPageSupplements;

  factory RecordsPageSupplements.empty() => RecordsPageSupplements(
      totalRecords: TotalRecords(), category: Category(), date: DateTime.now());
}
