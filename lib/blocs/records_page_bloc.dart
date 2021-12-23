import '../source.dart';

class RecordsPageBloc extends Cubit<RecordsPageState> {
  RecordsPageBloc(this.recordsService, this.prefsService)
      : super(RecordsPageState.initial()) {
    recordsService.getRecordsStream.listen((data) {
      _handleRecordsStream(data);
    });
  }

  final RecordsService recordsService;
  final PreferencesService prefsService;

  final _dummyId = '-1';

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

  void delete(String id) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    recordsService.delete(id);
  }

  void updateId(String id) => _updateSupplements(id: id);

  void updateDay(int day) => _updateSupplements(day: day);

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
    supplements = supplements.copyWith(withTotalsDays: withTotalsDays, day: -1);
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  void _updateSupplements({int? day, String? id}) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var supplements = state.supplements;
    supplements = supplements.copyWith(
      day: day ?? supplements.day,
      id: id ?? supplements.id,
    );
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  _handleRecordsStream(Map data) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final recordList = data[kRecords];
    final totalRecords = data[kTotalRecords];
    final supplements = state.supplements.copyWith(
        totalRecords: totalRecords,
        id: _dummyId,
        totalsMap: data[kAllDaysTotals]);
    emit(RecordsPageState.content(recordList, supplements));
  }
}
