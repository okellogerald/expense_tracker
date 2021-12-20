import '../source.dart';

class RecordsPageBloc extends Cubit<RecordsPageState> {
  RecordsPageBloc(this.recordsService, this.categoriesService)
      : super(RecordsPageState.initial()) {
    recordsService.getRecordStream.listen((recordsList) {
      _handleRecordsStream(recordsList);
    });
    recordsService.getTotalRecordsStream.listen((totalRecords) {
      _handleTotalRecordsStream(totalRecords);
    });
  }

  final RecordsService recordsService;
  final CategoriesService categoriesService;

  void init() {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final recordList = recordsService.getAll();
    final categories = categoriesService.getCategories();
    final supplements = state.supplements.copyWith(categoryList: categories);
    emit(RecordsPageState.content(recordList, supplements));
  }

  void add() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    recordsService.add(supplements.category, supplements.amount);
    emit(RecordsPageState.success(state.recordList, supplements));
  }

  void _updateSupplements({int? amount, String? type, Category? category}) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var supplements = state.supplements;

    if (type != null) {
      supplements = supplements.copyWith(
        amount: amount ?? supplements.amount,
        type: type,
        category: Category(),
      );
    } else {
      supplements = supplements.copyWith(
        amount: amount ?? supplements.amount,
        type: type ?? supplements.type,
        category: category ?? supplements.category,
      );
    }
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  _validate() {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    var supplements = state.supplements;

    if (supplements.category.id == '-1') {
      supplements = supplements
          .copyWith(errors: {'category': 'You have not selected the category'});
      emit(RecordsPageState.content(state.recordList, supplements));
    } else if (supplements.amount == 0) {
      supplements =
          supplements.copyWith(errors: {'amount': 'The amount can\'t be 0'});
      emit(RecordsPageState.content(state.recordList, supplements));
    } else {
      supplements = state.supplements.copyWith(errors: {});
      emit(RecordsPageState.content(state.recordList, supplements));
    }
  }

  _handleRecordsStream(List<Record> recordList) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    emit(RecordsPageState.content(recordList, state.supplements));
  }

  _handleTotalRecordsStream(TotalRecords totalRecords) {
    emit(RecordsPageState.loading(state.recordList, state.supplements));
    final supplements = state.supplements.copyWith(totalRecords: totalRecords);
    emit(RecordsPageState.content(state.recordList, supplements));
  }

  void updateType(String type) => _updateSupplements(type: type);

  void updateCategory(Category category) =>
      _updateSupplements(category: category);

  void updateAmount(String amount) =>
      _updateSupplements(amount: int.parse(amount));
}
