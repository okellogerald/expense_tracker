import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'freezed_models/records_page_supplements.freezed.dart';

@freezed
class RecordsPageSupplements with _$RecordsPageSupplements {
  const RecordsPageSupplements._();

  const factory RecordsPageSupplements({
    required TotalRecords totalRecords,
    @Default('-1') String id,
    @Default(-1) int day,
    @Default([]) List withTotalsDays,
    @Default({}) Map<int, List<double>> totalsMap,
    @Default(0) int currency,
  }) = _RecordsPageSupplements;

  factory RecordsPageSupplements.empty() =>
      RecordsPageSupplements(totalRecords: TotalRecords());

  String getIncomeTotal(int day) =>
      Utils.convertToMoneyFormat(totalsMap[day]!.first);
  String getExpensesTotal(int day) =>
      Utils.convertToMoneyFormat(totalsMap[day]!.last);
}
