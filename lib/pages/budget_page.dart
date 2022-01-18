import '../source.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
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
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildLoading(BudgetPageSupplements supp) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(BudgetPageSupplements supp) {
    if (supp.budgetList.isEmpty) return _buildEmptyState();

    return ListView(
      padding: EdgeInsets.only(top: 50.dh),
      children: [
        _buildMonthlyBudgets(supp.budgetList, 'Monthly Budgets',
            Utils.getDaysInMonth(), supp.id),
        SizedBox(height: 70.dh)
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.dw, bottom: 10.dh),
            child: AppText(
              title,
              size: 22.dw,
              family: kFontFam2,
            ),
          ),
          Container(
            color: AppColors.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list
                  .map((e) => BudgetTile(
                        budget: e,
                        selectedId: id,
                        editCallback: (budget) =>
                            BudgetEditPage.navigateTo(context, budget: budget),
                        deleteCallback: bloc.delete,
                        updateIdCallback: bloc.updateId,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
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
            size: 15.dw,
            color: AppColors.onBackground2,
            alignment: TextAlign.center,
          )
        ],
      ),
    );
  }

  _buildFloatingActionButton() {
    return AppIconButton(
      onPressed: () => BudgetEditPage.navigateTo(context),
      buttonColor: AppColors.primary,
      icon: Icons.add,
      iconColor: AppColors.onPrimary,
      height: 55.dw,
      width: 55.dw,
      spreadRadius: 30.dw,
      iconSize: 30.dw,
    );
  }
}
