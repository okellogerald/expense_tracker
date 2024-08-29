import 'package:expense_tracker/blocs/blocs_source.dart';
import 'package:expense_tracker/models/models_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_page_supplements.freezed.dart';

@freezed
class ReportsPageSupplements with _$ReportsPageSupplements {
  const factory ReportsPageSupplements({
    required TotalRecords totalRecords,
    required CurrentAnalysis currentAnalysis,
    required List<Record> records,
    required int index,
  }) = _ReportsPageSupplements;

  factory ReportsPageSupplements.empty() => ReportsPageSupplements(
        totalRecords: TotalRecords(),
        currentAnalysis: CurrentAnalysis.so_far,
        records: [],
        index: -1,
      );
}
