import '../source.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');
  late final ReportsPageBloc bloc;
  late final RecordsService recordsService;

  @override
  void initState() {
    recordsService = Provider.of<RecordsService>(context, listen: false);
    bloc = ReportsPageBloc(recordsService);
    bloc.init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ReportsPageBloc, ReportsPageState>(
            bloc: bloc,
            builder: (_, state) {
              return state.when(loading: _buildLoading, content: _buildContent);
            }));
  }

  Widget _buildLoading(ReportsPageSupplements supp) {
    return Center(
      child: SizedBox(
          height: 50.dh,
          width: 50.dw,
          child: const CircularProgressIndicator()),
    );
  }

  Widget _buildContent(ReportsPageSupplements supp) {
    return ListView(
      padding: EdgeInsets.only(top: 40.dh),
      children: [
        _buildSoFarSection('So far', supp, CurrentAnalysis.so_far),
        _buildIncomeSection('Income Analysis', supp, CurrentAnalysis.income),
        _buildExpensesSection(
            'Expenses Analysis', supp, CurrentAnalysis.expenses),
        _buildSectionTitle(
            'Daily Budget Analysis', supp, CurrentAnalysis.budgets),
        Padding(
          padding: EdgeInsets.only(top: 15.dh),
          child: _buildSectionTitle(
              'All Categories', supp, CurrentAnalysis.all_categories),
        )
      ],
    );
  }

  _buildSoFarSection(String title, ReportsPageSupplements supp,
      CurrentAnalysis sectionAnalysis) {
    final isSelected = supp.currentAnalysis == sectionAnalysis;

    return Container(
      color: !isSelected ? Colors.transparent : appColors.backgroundColor2,
      margin: EdgeInsets.only(bottom: 15.dh),
      padding: isSelected ? EdgeInsets.symmetric(vertical: 15.dh) : null,
      child: Column(
        children: [
          _buildSectionTitle(title, supp, sectionAnalysis),
          isSelected
              ? PieChart(
                  income: supp.totalRecords.totalIncome,
                  expenses: supp.totalRecords.totalExpenses,
                  backgroundColor: appColors.backgroundColor,
                  backgroundColor2: appColors.textColor,
                  textColor: appColors.backgroundColor,
                )
              : Container(),
        ],
      ),
    );
  }

  _buildIncomeSection(String title, ReportsPageSupplements supp,
      CurrentAnalysis sectionAnalysis) {
    final isSelected = supp.currentAnalysis == sectionAnalysis;
    final list = supp.records.where((e) => e.category.type == kIncome).toList();

    return Container(
      color: !isSelected ? Colors.transparent : appColors.backgroundColor2,
      margin: EdgeInsets.only(bottom: 15.dh),
      padding: isSelected ? EdgeInsets.symmetric(vertical: 10.dh) : null,
      width: ScreenSizeConfig.getFullWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title, supp, sectionAnalysis),
          isSelected
              ? Container(
                  padding: EdgeInsets.only(left: 15.dw),
                  height: 280.dh,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: list
                          .map((e) => GestureDetector(
                                onTap: () => bloc.updateIndex(e.category.id),
                                child: BarChart(
                                    valueColor: const Color(0xffFF6675),
                                    lineColor: appColors.textColor,
                                    value: e.amount /
                                        supp.totalRecords.totalIncome,
                                    title: e.category.title),
                              ))
                          .toList()),
                )
              : Container(),
        ],
      ),
    );
  }

  _buildExpensesSection(String title, ReportsPageSupplements supp,
      CurrentAnalysis sectionAnalysis) {
    final isSelected = supp.currentAnalysis == sectionAnalysis;
    final list =
        supp.records.where((e) => e.category.type == kExpense).toList();

    return Container(
      color: !isSelected ? Colors.transparent : appColors.backgroundColor2,
      margin: EdgeInsets.only(bottom: 15.dh),
      width: ScreenSizeConfig.getFullWidth,
      padding: isSelected ? EdgeInsets.symmetric(vertical: 10.dh) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title, supp, sectionAnalysis),
          isSelected
              ? Container(
                  padding: EdgeInsets.only(left: 15.dw),
                  height: 280.dh,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: list
                          .map((e) => BarChart(
                              valueColor: const Color(0xff6E71D8),
                              lineColor: appColors.textColor,
                              value: e.amount / supp.totalRecords.totalExpenses,
                              title: e.category.title))
                          .toList()),
                )
              : Container(),
        ],
      ),
    );
  }

  _buildSectionTitle(String title, ReportsPageSupplements supp,
      CurrentAnalysis sectionAnalysis) {
    final isSelected = supp.currentAnalysis == sectionAnalysis;

    return Padding(
      padding: EdgeInsets.only(left: 15.dw),
      child: Row(
        children: [
          AppIconButton(
            onPressed: () => bloc.updateSelectedAnalysis(sectionAnalysis),
            icon: isSelected ? Icons.remove : Icons.add,
            iconColor: appColors.primaryColor,
          ),
          SizedBox(width: 10.dw),
          AppText(
            title.toUpperCase(),
            family: kFontFam2,
            size: 15.dw,
            color: appColors.textColor,
          ),
        ],
      ),
    );
  }
}
