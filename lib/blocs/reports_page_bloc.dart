import '../source.dart';

// ignore: constant_identifier_names
enum CurrentAnalysis { so_far, income, expenses, all_categories, none }

class ReportsPageBloc extends Cubit<ReportsPageState> {
  ReportsPageBloc(this.recordsService) : super(ReportsPageState.initial());

  final RecordsService recordsService;

  void init() {
    var supp = state.supp;
    emit(ReportsPageState.loading(supp));
    final totalRecords = recordsService.getTotalAmounts();
    var records = recordsService.getUniqueRecords();
    records.sort((a, b) => a.amount.compareTo(b.amount));
    records = records.reversed.toList();
    supp = supp.copyWith(totalRecords: totalRecords, records: records);
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
    supp = supp.copyWith(index: -1);
    emit(ReportsPageState.content(supp));
  }

  void updateIndex(String id) {
    var supp = state.supp;
    emit(ReportsPageState.loading(supp));
    final index = supp.records.indexWhere((e) => e.category.id == id);
    if (index == supp.index) {
      supp = supp.copyWith(index: -1);
    } else {
      supp = supp.copyWith(index: index);
    }
    emit(ReportsPageState.content(supp));
  }
}
