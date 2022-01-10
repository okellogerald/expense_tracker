import '../source.dart';

// ignore: constant_identifier_names
enum CurrentAnalysis { so_far, budgets, income, expenses, none }

class ReportsPageBloc extends Cubit<ReportsPageState> {
  ReportsPageBloc(this.recordsService) : super(ReportsPageState.initial());

  final RecordsService recordsService;

  void init() {
    var supp = state.supp;
    emit(ReportsPageState.loading(supp));
    final totalRecords = recordsService.getTotalAmounts();
    supp = supp.copyWith(totalRecords: totalRecords);
    emit(ReportsPageState.content(supp));
  }

  void updateSelectedAnalysis(CurrentAnalysis analysis) {
    var supp = state.supp;
    emit(ReportsPageState.loading(supp));
    if (analysis == supp.currentAnalysis) {
      supp = supp.copyWith(currentAnalysis: CurrentAnalysis.none);
    } else {
      supp = supp.copyWith(currentAnalysis: analysis);
    }
    emit(ReportsPageState.content(supp));
  }
}
