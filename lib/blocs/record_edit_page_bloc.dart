import '../source.dart';

class RecordEditPageBloc extends Cubit<RecordEditPageState> {
  RecordEditPageBloc(
      this.recordsService, this.categoriesService, this.grossAmountsService)
      : super(RecordEditPageState.initial());

  final RecordsService recordsService;
  final CategoriesService categoriesService;
  final GrossAmountsService grossAmountsService;
  final _dummyCategory = Category();
  double _beforeEditAmount = 0.0;

  void init({Record? record}) {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));
    var category = _dummyCategory;
    var form = state.form;
    final categoryList = categoriesService.getCategories();
    if (record != null) {
      form = form.copyWith(
        amount: record.amount,
        id: record.id,
        notes: record.notes,
        date: record.date,
      );
      category = record.category;
      _beforeEditAmount = record.amount;
    }
    emit(RecordEditPageState.content(categoryList, category, form));
  }

  void edit() {
    _validate();

    if (state.form.errors.isNotEmpty) return;
    final form = state.form;
    final category = state.category;
    final record = Record.empty().copyWith(
      id: form.id,
      date: form.date,
      category: category,
      amount: form.amount,
      notes: form.notes,
    );
    recordsService.edit(record);
    grossAmountsService.editAmount(category.id, form.amount, _beforeEditAmount);
    emit(RecordEditPageState.success(state.categoryList, category, form));
  }

  void add() {
    _validate();

    if (state.form.errors.isNotEmpty) return;
    final form = state.form;
    final category = state.category;
    final record = Record.empty().copyWith(
      category: category,
      amount: form.amount,
      notes: form.notes,
    );
    recordsService.add(record);
    grossAmountsService.add(category.id, category.title, form.amount);
    emit(RecordEditPageState.success(state.categoryList, category, form));
  }

  void updateCategory(Category c) => _updateAttributes(category: c);

  void updateType(String type) {
    final category = _dummyCategory.copyWith(type: type.toLowerCase());
    _updateAttributes(category: category);
  }

  void updateAmount(String amount) {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));
    final _amount = double.tryParse(amount);
    if (amount.trim().isEmpty) {
      final form = state.form.copyWith(amount: 0, errors: {});
      emit(RecordEditPageState.content(
          state.categoryList, state.category, form));
      return;
    }
    if (_amount == null) {
      final error = {'amount': 'Invalid amount is entered'};
      final form = state.form.copyWith(errors: error);
      emit(RecordEditPageState.content(
          state.categoryList, state.category, form));
      return;
    }
    final form = state.form.copyWith(amount: _amount, errors: {});
    emit(RecordEditPageState.content(state.categoryList, state.category, form));
  }

  void updateNotes(String notes) => _updateAttributes(notes: notes);

  void _updateAttributes({Category? category, double? amount, String? notes}) {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));
    final _category = category ?? state.category;
    final form = state.form;
    final updatedForm = form.copyWith(
        amount: amount ?? form.amount, notes: notes ?? form.notes);
    emit(RecordEditPageState.content(
        state.categoryList, _category, updatedForm));
  }

  _validate() {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));

    var errors = <String, dynamic>{};

    if (state.category.id == '-1') {
      errors = {'category': 'You have not selected the category'};
    } else if (state.form.amount == 0) {
      errors = {'amount': 'The amount can\'t be 0'};
    }
    final form = state.form.copyWith(errors: errors);
    emit(RecordEditPageState.content(state.categoryList, state.category, form));
  }
}
