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
    @Default(-1) int day,
    @Default({}) Map<int, List<double>> totalsMap,
    @Default([]) List<Category> categoryList,
    @Default({}) Map<String, dynamic> errors,
  }) = _RecordsPageSupplements;

  factory RecordsPageSupplements.empty() => RecordsPageSupplements(
      totalRecords: TotalRecords(), category: Category(), date: DateTime.now());

  String getIncomeTotal(int day) => Utils.convertToMoneyFormat(totalsMap[day]!.first);
   String getExpensesTotal(int day) => Utils.convertToMoneyFormat(totalsMap[day]!.last);
}
