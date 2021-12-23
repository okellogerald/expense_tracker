import '../source.dart';

class RecordEditPageBloc extends Cubit<RecordEditPageState> {
  RecordEditPageBloc(this.recordsService, this.categoriesService)
      : super(RecordEditPageState.initial());

  final RecordsService recordsService;
  final CategoriesService categoriesService;
  final _dummyCategory = Category();

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
    }
    emit(RecordEditPageState.content(categoryList, category, form));
  }

  void edit() {
    _validate();

    if (state.form.errors.isNotEmpty) return;
    final form = state.form;
    final record = Record.empty().copyWith(
      id: form.id,
      date: form.date,
      category: state.category,
      amount: form.amount,
      notes: form.notes,
    );
    recordsService.edit(record);
    emit(RecordEditPageState.success(state.categoryList, state.category, form));
  }

  void add() {
    _validate();

    if (state.form.errors.isNotEmpty) return;
    final form = state.form;
    final record = Record.empty().copyWith(
      category: state.category,
      amount: form.amount,
      notes: form.notes,
    );
    recordsService.add(record);
    emit(RecordEditPageState.success(state.categoryList, state.category, form));
  }

  void updateCategory(Category c) => _updateAttributes(category: c);

  void updateType(String type) {
    final category = _dummyCategory.copyWith(type: type);
    _updateAttributes(category: category);
  }

  void updateAmount(String a) =>
      _updateAttributes(amount: a.trim().isEmpty ? 0 : double.parse(a));

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
