import 'package:expense_tracker/widgets/app_divider.dart';

import '../source.dart';
import '../utils/navigation_logic.dart';
import '../widgets/app_floating_action_button.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  late final BudgetPageBloc bloc;
  late final BudgetsService budgetsService;
  late final GrossAmountsService grossAmountsService;
  late final RecordsService recordsService;

  @override
  void initState() {
    budgetsService = Provider.of<BudgetsService>(context, listen: false);
    recordsService = Provider.of<RecordsService>(context, listen: false);
    grossAmountsService =
        Provider.of<GrossAmountsService>(context, listen: false);
    bloc = BudgetPageBloc(budgetsService, grossAmountsService, recordsService);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<BudgetPageBloc, BudgetPageState>(
            bloc: bloc,
            builder: (_, state) {
              return state.when(loading: _buildLoading, content: _buildContent);
            }),
        floatingActionButton: AppFloatingActionButton(
            onPressed: () => push(const BudgetEditPage())));
  }

  Widget _buildLoading(BudgetPageSupplements supp) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(BudgetPageSupplements supp) {
    if (supp.budgetList.isEmpty) return _buildEmptyState();

    return ListView(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 70.dh,
      ),
      children: [
        _buildMonthlyBudgets(
            supp.budgetList, 'Monthly Budgets', Utils.getDaysInMonth(), supp.id)
      ],
    );
  }

  _buildMonthlyBudgets(
      List<Budget> budgetList, String title, int duration, String id) {
    var list = <Budget>[];
    list = budgetList.where((e) => e.duration == duration).toList();

    if (list.isEmpty) return Container();
    return Padding(
        padding: EdgeInsets.only(bottom: 25.dh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 15.dw, bottom: 10.dh),
              child: AppText(title, size: 22.dw, family: kFontFam2)),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.dh),
              decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(15.dw)),
              child: Scrollbar(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: budgetList.length,
                  separatorBuilder: (_, __) => AppDivider(
                      color: AppColors.divider.withOpacity(.5),
                      margin: EdgeInsets.symmetric(
                          horizontal: 5.dw, vertical: 5.dh)),
                  itemBuilder: (_, index) {
                    final budget = budgetList[index];
                    return BudgetTile(
                      budget: budget,
                      selectedId: id,
                      editCallback: (budget) =>
                          BudgetEditPage.navigateTo(context, budget: budget),
                      deleteCallback: bloc.delete,
                      updateIdCallback: bloc.updateId,
                    );
                  },
                ),
              ))
        ]));
  }

  _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/budgets.png',
            height: 100.dh,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20.dh),
          AppText(
            'You have not created any budget yet. All the budgets will be shown on this page.',
            size: 14.dw,
            color: AppColors.onBackground2,
            alignment: TextAlign.center,
          )
        ],
      ),
    );
  }
}
