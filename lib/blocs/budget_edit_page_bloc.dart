import '../source.dart';

class BudgetEditPageBloc extends Cubit<BudgetEditPageState> {
  BudgetEditPageBloc(this.categoriesService, this.budgetsService)
      : super(BudgetEditPageState.initial());

  final CategoriesService categoriesService;
  final BudgetsService budgetsService;

  final _idList = <String>[];
  final _values = <String, String>{};
  var _categoryList = <Category>[];

  void init({Budget? budget}) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    if (budget != null) {
      final categoryList = [budget.category];
      final idList = [budget.category.id];
      _values[budget.category.id] = budget.amount.toString();
      final form = state.form.copyWith(
        duration: budget.duration,
        values: _values,
        id: budget.id,
      );
      emit(BudgetEditPageState.content(categoryList, idList, form));
      return;
    }

    final categoryList = categoriesService.getCategories();
    _categoryList = categoryList.where((e) => e.type == kExpense).toList();
    final expensesList = _categoryList
        .where((e) => !budgetsService.isExisting(1, e.id))
        .toList();
    final form = state.form.copyWith(duration: Utils.getDaysInMonth());
    emit(BudgetEditPageState.content(expensesList, state.idList, form));
  }

  void updateDuration(int duration) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    final form = state.form.copyWith(duration: duration);
    final categoryList = _categoryList
        .where((e) => !budgetsService.isExisting(duration, e.id))
        .toList();
    emit(BudgetEditPageState.content(categoryList, state.idList, form));
  }

  void updateCustomDuration(String duration) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    final _duration = int.parse(duration);
    final form = state.form.copyWith(duration: _duration);
    final categoryList = _categoryList
        .where((e) => !budgetsService.isExisting(_duration, e.id))
        .toList();
    emit(BudgetEditPageState.content(categoryList, state.idList, form));
  }

  void updateIdList(String id) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    if (!_idList.contains(id)) {
      _idList.add(id);
      _values[id] = '';
    } else {
      _idList.remove(id);
      _values.remove(id);
    }
    final form = state.form.copyWith(values: _values);
    emit(BudgetEditPageState.content(state.categoryList, _idList, form));
  }

  void updateAmount(String id, String amount) {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));
    _values[id] = amount;
    final form = state.form.copyWith(values: _values);
    emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
  }

  void edit() {
    _validate();

    final form = state.form;
    final amount = double.parse(form.values[state.idList.first]!);

    budgetsService.edit(form.id, amount);
    emit(BudgetEditPageState.success(state.categoryList, state.idList, form));
  }

  void add() {
    _validate();

    final selectedList =
        state.categoryList.where((e) => _idList.contains(e.id)).toList();

    for (Category category in selectedList) {
      final form = state.form;
      final amount = double.parse(form.values[category.id]!);
      budgetsService.add(category, amount, form.duration);
      _idList.remove(category.id);
      _values.remove(category.id);
    }

    final form = state.form.copyWith(values: _values);

    emit(BudgetEditPageState.success(state.categoryList, _idList, form));
  }

  _validate() {
    emit(BudgetEditPageState.loading(
        state.categoryList, state.idList, state.form));

    var errors = <String, String>{};

    for (String id in state.idList) {
      final value = state.form.values[id];
      if (value == null || value.trim().isEmpty) {
        errors[id] = 'Amount can\'t be zero';
        continue;
      }
      final amount = double.tryParse(value);
      if (amount == null) {
        errors[id] = 'Invalid amount is entered';
        continue;
      }
    }

    final form = state.form.copyWith(errors: errors);

    if (errors.isNotEmpty) {
      emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
      return;
    } else {
      final form = state.form.copyWith(errors: {});
      emit(BudgetEditPageState.content(state.categoryList, state.idList, form));
    }
  }
}
