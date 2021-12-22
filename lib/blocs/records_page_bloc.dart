import '../source.dart';

class RecordsPageBloc extends Cubit<RecordsPageState> {
  RecordsPageBloc(this.recordsService, this.categoriesService)
      : super(RecordsPageState.initial()) {
    recordsService.getRecordsStream.listen((data) {
      _handleRecordsStream(data);
    });
  }

  final RecordsService recordsService;
  final CategoriesService categoriesService;

  static const _dummyId = '-1';

  void init({Record? record}) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var recordList = state.recordList;
    recordList = recordsService.getAll();
    final categories = categoriesService.getCategories();
    final totalRecords = recordsService.getTotalAmounts();
    var supplements = state.supplements
        .copyWith(categoryList: categories, totalRecords: totalRecords);
    if (record != null) {
      supplements = supplements.copyWith(
        id: record.id,
        amount: record.amount,
        category: record.category,
        type: record.category.type,
        notes: record.notes,
      );
    }
    emit(RecordsPageState.content(recordList, supplements));
  }

  void add() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    recordsService.add(
        supplements.category, supplements.amount, supplements.notes);
    emit(RecordsPageState.success(
        state.recordList, supplements.copyWith(id: _dummyId)));
  }

  void edit() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    recordsService.edit(supplements.id, supplements.category,
        supplements.amount, supplements.notes);
    emit(RecordsPageState.success(
        state.recordList, supplements.copyWith(id: _dummyId)));
  }

  void delete(String id) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    recordsService.delete(id);
    //emit(RecordsPageState.content(state.recordList, state.supplements));
  }

  void updateId(String id) => _updateSupplements(id: id);

  void updateType(String type) => _updateSupplements(type: type);

  void updateCategory(Category category) =>
      _updateSupplements(category: category);

  void updateAmount(String amount) =>
      _updateSupplements(amount: double.parse(amount));

  void updateNotes(String notes) => _updateSupplements(notes: notes);

  void updateDay(int day) => _updateSupplements(day: day);

  void showDayTotals(int day) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final dayTotals = recordsService.getTotalAmountsByDay(day);
    var supplements = state.supplements;
    final totalsMap = _modifyMap(supplements.totalsMap, dayTotals);
    supplements = supplements.copyWith(totalsMap: totalsMap, day: -1);
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  void _updateSupplements(
      {double? amount,
      String? type,
      Category? category,
      Map<int, List<double>>? totalsMap,
      int? day,
      String? notes,
      String? id}) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var supplements = state.supplements;

    if (type != null) {
      supplements = supplements.copyWith(
        type: type,
        category: Category(),
      );
    } else {
      supplements = supplements.copyWith(
        id: id ?? supplements.id,
        amount: amount ?? supplements.amount,
        type: type ?? supplements.type,
        category: category ?? supplements.category,
        notes: notes ?? supplements.notes,
        totalsMap: totalsMap ?? supplements.totalsMap,
        day: day ?? supplements.day,
      );
    }
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  Map<int, List<double>> _modifyMap(
      Map<int, List<double>> totalsMap, List<double> amountsList) {
    final s = state.supplements;
    Map<int, List<double>> map = {};
    totalsMap.forEach((key, value) {
      map[key] = value;
    });
    map[s.day] = amountsList;
    return map;
  }

  _validate() {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var supplements = state.supplements;

    if (supplements.category.id == '-1') {
      supplements = supplements
          .copyWith(errors: {'category': 'You have not selected the category'});
    } else if (supplements.amount == 0) {
      supplements =
          supplements.copyWith(errors: {'amount': 'The amount can\'t be 0'});
    } else {
      supplements = state.supplements.copyWith(errors: {});
    }
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  _handleRecordsStream(Map<String, dynamic> data) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final recordList = data[kRecords];
    final totalRecords = data[kTotalRecords];
    final supplements =
        state.supplements.copyWith(totalRecords: totalRecords, id: _dummyId);
    emit(RecordsPageState.content(recordList, supplements));
  }
}
