import '../source.dart';

class BudgetEditPageBloc extends Cubit<BudgetEditPageState> {
  BudgetEditPageBloc(this.categoriesService, this.budgetsService)
      : super(BudgetEditPageState.initial());

  final CategoriesService categoriesService;
  final BudgetsService budgetsService;

  final _idList = <String>[];
  final _values = <String, double>{};

  void init() {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    final categoryList = categoriesService.getCategories();
    final expensesList = categoryList.where((e) => e.type == kExpense).toList();
    final form = state.form.copyWith(duration: 1);
    emit(BudgetEditPageState.content(expensesList, state.idList, form));
  }

  void updateDuration(int duration) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    final form = state.form.copyWith(duration: duration);
    emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
  }

  void updateIdList(String id) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    if (!_idList.contains(id)) {
      _idList.add(id);
      _values[id] = 0;
    } else {
      _idList.remove(id);
      _values.remove(id);
    }
    final form = state.form.copyWith(values: _values);
    emit(BudgetEditPageState.content(state.categoryList, _idList, form));
  }

  void markAsDone() {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    final form = state.form.copyWith(isDoneSelectingCategories: true);
    emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
  }

  void updateAmount(String id, String amount) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    final _amount = double.tryParse(amount);

    if (_amount == 0) {
      final error = {id: 'Amount can\'t be zero'};
      _values[id] = 0;
      final form = state.form.copyWith(errors: error, values: _values);
      emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
      return;
    }
    if (_amount == null) {
      final error = {id: 'Invalid amount is entered'};
      final form = state.form.copyWith(errors: error, values: _values);
      emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
      return;
    }
    _values[id] = _amount;
    final form = state.form.copyWith(values: _values, errors: {});
    emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
  }

  void uploadBudgets() {
    if (state.form.errors.isNotEmpty) return;

    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));

    for (String id in state.idList) {
      final value = state.form.values[id];
      if (value == null || value == 0) {
        final errors = {id: 'Amount can\'t be zero'};
        final form = state.form.copyWith(errors: errors);
        emit(BudgetEditPageState.content(
            state.categoryList, state.idList, form));
        return;
      }
    }

    final selectedList =
        state.categoryList.where((e) => _idList.contains(e.id)).toList();

    for (Category category in selectedList) {
      final form = state.form;
      budgetsService.add(category, form.values[category.id]!, form.duration);
      _idList.remove(category.id);
      _values.remove(category.id);
    }

    final form = state.form.copyWith(values: _values, errors: {});

    emit(BudgetEditPageState.success(state.categoryList, _idList, form));
  }
}
