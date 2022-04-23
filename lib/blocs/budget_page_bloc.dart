import '../source.dart';

class BudgetPageBloc extends Cubit<BudgetPageState> {
  BudgetPageBloc(
      this.budgetsService, this.grossAmountsService, this.recordsService)
      : super(BudgetPageState.initial()) {
    budgetsService.getBudgetListStream.listen((List<Budget> budgetList) {
      _handleBudgetListStream(budgetList);
    });
  }

  final BudgetsService budgetsService;
  final GrossAmountsService grossAmountsService;
  final RecordsService recordsService;

  void init({List<Budget> budgetList = const []}) {
    var supp = state.supp;
    emit(BudgetPageState.loading(supp));
    if (budgetList.isEmpty) budgetList = budgetsService.getBudgets();
    final grossAmountsMap = grossAmountsService.getAll();

    for (Budget budget in budgetList) {
      final index = budgetList.indexOf(budget);
      final _updatedBudget =
          budget.copyWith(used: grossAmountsMap[budget.category.id]?.amount);
      budgetList[index] = _updatedBudget;
      recordsService.getDailyAmountByCategory(budget.category);
    }

    supp = supp.copyWith(budgetList: budgetList);
    emit(BudgetPageState.content(supp));
  }

  void updateId(String id) {
    var supp = state.supp;
    emit(BudgetPageState.loading(supp));
    supp = supp.copyWith(id: id);
    emit(BudgetPageState.content(supp));
  }

  void delete(String id) {
    var supp = state.supp;
    emit(BudgetPageState.loading(supp));
    budgetsService.delete(id);
  }

  _handleBudgetListStream(List<Budget> budgetList) =>
      init(budgetList: budgetList);
}
