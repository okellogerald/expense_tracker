import '../source.dart';

class RecordEditPageBloc extends Cubit<RecordEditPageState> {
  RecordEditPageBloc(
      this.recordsService, this.categoriesService, this.grossAmountsService)
      : super(RecordEditPageState.initial()) {
    categoriesService.addListener(_handleCategoryUpdates);
  }

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
    final categoryList = categoriesService.getAll();
    if (record != null) {
      form = form.copyWith(
        amount: record.amount.toString(),
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
    final amount = double.parse(form.amount);
    final record = Record.empty().copyWith(
      id: form.id,
      date: form.date,
      category: category,
      amount: amount,
      notes: form.notes,
    );
    recordsService.edit(record);
    grossAmountsService.editAmount(category.id, amount, _beforeEditAmount);
    emit(RecordEditPageState.success(state.categoryList, category, form));
  }

  void add() {
    _validate();

    if (state.form.errors.isNotEmpty) return;
    final form = state.form;
    final category = state.category;
    final amount = double.parse(form.amount);
    final record = Record.empty().copyWith(
      category: category,
      amount: amount,
      notes: form.notes,
    );
    recordsService.add(record);
    grossAmountsService.add(category.id, category.title, amount);
    emit(RecordEditPageState.success(state.categoryList, category, form));
  }

  void updateCategory(Category c) => _updateAttributes(category: c);

  void updateType(String type) {
    final category = _dummyCategory.copyWith(type: type.toLowerCase());
    _updateAttributes(category: category);
  }

  void updateAmount(String amount) => _updateAttributes(amount: amount);

  void updateNotes(String notes) => _updateAttributes(notes: notes);

  void _updateAttributes({Category? category, String? amount, String? notes}) {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));
    final _category = category ?? state.category;
    final form = state.form;
    final updatedForm = form.copyWith(
        amount: amount ?? form.amount, notes: notes ?? form.notes, errors: {});
    emit(RecordEditPageState.content(
        state.categoryList, _category, updatedForm));
  }

  _validate() {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));

    var errors = <String, dynamic>{};
    var form = state.form;

    if (state.category.id == '-1') {
      errors['category'] = 'You have not selected the category';
    }

    final amount = double.tryParse(form.amount);
    if (amount == null) {
      errors['amount'] = 'Invalid amount is entered';
    }
    if (amount == 0 || state.form.amount.trim().isEmpty) {
      errors['amount'] = 'Amount can\'t be 0';
    }

    form = state.form.copyWith(errors: errors);
    emit(RecordEditPageState.content(state.categoryList, state.category, form));
  }

  void _handleCategoryUpdates() {
    emit(RecordEditPageState.loading(
        state.categoryList, state.category, state.form));
    final categories = categoriesService.getCategories;
    emit(RecordEditPageState.content(categories, state.category, state.form));
  }
}
