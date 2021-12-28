import '../source.dart';

class BudgetPageBloc extends Cubit<BudgetPageState> {
  BudgetPageBloc(this.budgetService, this.grossAmountsService)
      : super(BudgetPageState.initial()) {
    budgetService.getBudgetListStream.listen((List<Budget> budgetList) {
      _handleBudgetListStream(budgetList);
    });
  }

  final BudgetsService budgetService;
  final GrossAmountsService grossAmountsService;

  void init({List<Budget> budgetList = const []}) {
    emit(BudgetPageState.loading(state.budgetList));
    if (budgetList.isEmpty) budgetList = budgetService.getBudgets();
    final grossAmountsMap = grossAmountsService.getAll();

    for (Budget budget in budgetList) {
      final index = budgetList.indexOf(budget);
      final _updatedBudget = budget.copyWith(
          used: grossAmountsMap[budget.category.id]?.amount);
      budgetList[index] = _updatedBudget;
    }
    emit(BudgetPageState.content(budgetList));
  }

  _handleBudgetListStream(List<Budget> budgetList) =>
      init(budgetList: budgetList);
}
