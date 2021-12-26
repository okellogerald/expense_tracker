import '../source.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  late final BudgetPageBloc bloc;
  late final BudgetsService service;

  @override
  void initState() {
    service = Provider.of<BudgetsService>(context, listen: false);
    bloc = BudgetPageBloc(service);
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

  Widget _buildLoading(List<Budget> budgetList) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(List<Budget> budgetList) {
    if (budgetList.isEmpty) return _buildEmptyState();

    return ListView(
      padding: EdgeInsets.only(top: 50.dh),
      children: [
        _buildBudgets(budgetList, Utils.getDaysInMonth(), 'Monthly Budgets'),
        _buildBudgets(budgetList, 7, 'Weekly Budgets'),
        _buildBudgets(budgetList, 1, 'Daily Budgets'),
        _buildBudgets(budgetList, 0, 'Custom Duration Budgets'),
      ],
    );
  }

  _buildBudgets(List<Budget> budgetList, int duration, String title) {
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
            padding: EdgeInsets.only(left: 15.dw),
            child: AppText(title, size: 22.dw),
          ),
          Container(
            color: Colors.white12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list.map((e) => _buildBudget(e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBudget(Budget budget) {
    final category = budget.category;
    final duration = budget.duration;
    final hasCustomDuration =
        duration != 1 && duration != 7 && duration != Utils.getDaysInMonth();

    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.0),
          border:
              const Border(bottom: BorderSide(color: AppColors.dividerColor))),
      padding:
          EdgeInsets.only(left: 15.dw, bottom: 5.dh, right: 15.dw, top: 5.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    AppIcons.getIcon(category.codePoint),
                    color: Colors.white70,
                    size: 20.dw,
                  ),
                  SizedBox(width: 15.dw),
                  AppText(
                    budget.category.title,
                    family: kFontFam2,
                    size: 18.dw,
                  ),
                ],
              ),
              AppIconButton(
                onPressed: () {},
                icon: Icons.more_horiz,
                iconColor: Colors.white70,
                spreadRadius: 25.dw,
              )
            ],
          ),
          hasCustomDuration
              ? AppText(
                  budget.duration.toString() + ' days',
                  family: kFontFam2,
                  size: 18.dw,
                  color: AppColors.textColor2,
                )
              : Container(),
          _buildBudgetAmounts('Budget', budget.getAmount, AppColors.textColor),
          _buildBudgetAmounts('Used', budget.getAmount, AppColors.negative),
          _buildBudgetAmounts('Balance', budget.getAmount, AppColors.positive)
        ],
      ),
    );
  }

  _buildBudgetAmounts(String title, String amount, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          family: kFontFam2,
          size: 16.dw,
          color: AppColors.textColor2,
        ),
        AppText(
          amount,
          family: kFontFam2,
          size: 16.dw,
          color: color,
        )
      ],
    );
  }

  _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Center(
        child: AppText(
          'The budgets you create shall appear here.',
          size: 15.dw,
          color: AppColors.textColor2,
        ),
      ),
    );
  }

 

  _buildFloatingActionButton() {
    return AppIconButton(
      onPressed: () => BudgetEditPage.navigateTo(context),
      buttonColor: AppColors.primaryColor,
      icon: Icons.add,
      iconColor: Colors.black,
      height: 55.dw,
      width: 55.dw,
      spreadRadius: 30.dw,
      iconSize: 30.dw,
    );
  }
}
