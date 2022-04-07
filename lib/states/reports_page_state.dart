import 'package:budgetting_app/models/models_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/reports_page_state.freezed.dart';

@freezed
class ReportsPageState with _$ReportsPageState {
  const factory ReportsPageState.loading(ReportsPageSupplements supp) =
      _Loading;
  const factory ReportsPageState.content(ReportsPageSupplements supp) =
      _Content;

  factory ReportsPageState.initial() =>
      ReportsPageState.content(ReportsPageSupplements.empty());
}
