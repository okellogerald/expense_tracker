import '../source.dart';

class BudgetPageBloc extends Cubit<BudgetPageState> {
  BudgetPageBloc(this.budgetService) : super(BudgetPageState.initial());

  final BudgetsService budgetService;

  void init() {
    emit(BudgetPageState.loading(state.budgetList));
    final budgetList = budgetService.getBudgets();
    emit(BudgetPageState.content(budgetList));
  }
}
