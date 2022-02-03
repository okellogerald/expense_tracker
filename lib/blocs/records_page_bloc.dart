import '../source.dart';

class RecordsPageBloc extends Cubit<RecordsPageState> {
  RecordsPageBloc(
      this.recordsService, this.prefsService, this.grossAmountsService)
      : super(RecordsPageState.initial()) {
    recordsService.getRecordsStream.listen((data) {
      _handleRecordsStream(data);
    });
  }

  final RecordsService recordsService;
  final PreferencesService prefsService;
  final GrossAmountsService grossAmountsService;

  final _dummyId = '-1';
  final _dummyDay = -1;

  void init() {
    emit(RecordsPageState.loading(state.recordList, state.supplements));

    var recordList = state.recordList;
    recordList = recordsService.getAll();
    final totalRecords = recordsService.getTotalAmounts();
    final totalAmounts = recordsService.getAllTotalAmounts();
    final prefs = prefsService.getPreferences();
    var supplements = state.supplements.copyWith(
        totalRecords: totalRecords,
        totalsMap: totalAmounts,
        withTotalsDays: prefs[kWithTotalsList]);
    emit(RecordsPageState.content(recordList, supplements));
  }

  void delete(String id, double amount) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final record = state.recordList.where((e) => e.id == id).toList().first;
    grossAmountsService.delete(record.category.id, amount);
    recordsService.delete(id);
  }

  void updateId(String id) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final supplements = state.supplements.copyWith(day: _dummyDay, id: id);
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  void updateDay(int day) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final supplements = state.supplements.copyWith(day: day, id: _dummyId);
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  void showWithDayTotals(int day) => _updateDayTotalsVisibility(day, true);

  void removeFromWithDayTotals(int day) =>
      _updateDayTotalsVisibility(day, false);

  void _updateDayTotalsVisibility(int day, bool isAdding) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var withTotalsDays = [];
    if (isAdding) {
      withTotalsDays = prefsService.addDayToWithTotalsPrefs(day);
    } else {
      withTotalsDays = prefsService.removeFromWithTotalsPrefs(day);
    }
    var supplements = state.supplements;
    supplements =
        supplements.copyWith(withTotalsDays: withTotalsDays, day: _dummyDay);
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  _handleRecordsStream(Map data) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final recordList = data[kRecords];
    final totalRecords = data[kTotalRecords];
    final supplements = state.supplements.copyWith(
        totalRecords: totalRecords,
        id: _dummyId,
        day: _dummyDay,
        totalsMap: data[kAllDaysTotals]);
    emit(RecordsPageState.content(recordList, supplements));
  }
}
