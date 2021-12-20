import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'records_page_supplements.freezed.dart';

@freezed
class RecordsPageSupplements with _$RecordsPageSupplements {
  const RecordsPageSupplements._();

  const factory RecordsPageSupplements({
    required TotalRecords totalRecords,
    @Default(kIncome) type,
    @Default(0) amount,
    @Default([]) List<Category> categoryList,
    @Default({}) Map<String, dynamic> errors,
    required Category category,
  }) = _RecordsPageSupplements;

  factory RecordsPageSupplements.empty() => RecordsPageSupplements(
      totalRecords: TotalRecords(), category: Category());
}
