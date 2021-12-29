import '../source.dart';

class BudgetPageBloc extends Cubit<BudgetPageState> {
  BudgetPageBloc(this.budgetsService, this.grossAmountsService)
      : super(BudgetPageState.initial()) {
    budgetsService.getBudgetListStream.listen((List<Budget> budgetList) {
      _handleBudgetListStream(budgetList);
    });
  }

  final BudgetsService budgetsService;
  final GrossAmountsService grossAmountsService;

  void init({List<Budget> budgetList = const []}) {
    emit(BudgetPageState.loading(state.budgetList, state.id));
    if (budgetList.isEmpty) budgetList = budgetsService.getBudgets();
    final grossAmountsMap = grossAmountsService.getAll();

    for (Budget budget in budgetList) {
      final index = budgetList.indexOf(budget);
      final _updatedBudget =
          budget.copyWith(used: grossAmountsMap[budget.category.id]?.amount);
      budgetList[index] = _updatedBudget;
    }
    emit(BudgetPageState.content(budgetList, state.id));
  }

  void updateId(String id) =>
      emit(BudgetPageState.content(state.budgetList, id));

  void delete(String id) {
    emit(BudgetPageState.loading(state.budgetList, state.id));
    budgetsService.delete(id);
  }

  _handleBudgetListStream(List<Budget> budgetList) =>
      init(budgetList: budgetList);
}
