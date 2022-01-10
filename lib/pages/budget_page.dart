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

  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    budgetsService = Provider.of<BudgetsService>(context, listen: false);
    grossAmountsService =
        Provider.of<GrossAmountsService>(context, listen: false);
    bloc = BudgetPageBloc(budgetsService, grossAmountsService);
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

  Widget _buildLoading(List<Budget> budgetList, String id) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(List<Budget> budgetList, String id) {
    if (budgetList.isEmpty) return _buildEmptyState();

    return ListView(
      padding: EdgeInsets.only(top: 50.dh),
      children: [
        _buildBudgets(
            budgetList, Utils.getDaysInMonth(), 'Monthly Budgets', id),
        _buildBudgets(budgetList, 7, 'Weekly Budgets', id),
        _buildBudgets(budgetList, 1, 'Daily Budgets', id),
        _buildBudgets(budgetList, 0, 'Custom Duration Budgets', id),
        SizedBox(height: 70.dh)
      ],
    );
  }

  _buildBudgets(
      List<Budget> budgetList, int duration, String title, String id) {
    var list = <Budget>[];
    if (duration == 0) {
      list = budgetList
          .where((e) =>
              e.duration != 7 &&
              e.duration != Utils.getDaysInMonth() &&
              e.duration != 1)
          .toList();
    } else {
      list = budgetList.where((e) => e.duration == duration).toList();
    }

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
            color: appColors.backgroundColor2,
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
      child: Center(
        child: AppText(
          'The budgets you create shall appear here.',
          size: 15.dw,
          color: appColors.textColor2,
        ),
      ),
    );
  }

  _buildFloatingActionButton() {
    return AppIconButton(
      onPressed: () => BudgetEditPage.navigateTo(context),
      buttonColor: appColors.primaryColor,
      icon: Icons.add,
      iconColor: appColors.onPrimaryColor,
      height: 55.dw,
      width: 55.dw,
      spreadRadius: 30.dw,
      iconSize: 30.dw,
    );
  }
}
