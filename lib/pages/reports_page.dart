import '../source.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
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
    if (supp.records.isEmpty) return _buildEmptyState();

    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        _buildSoFarSection('So far', supp, CurrentAnalysis.so_far),
        _buildIncomeSection('Income Analysis', supp, CurrentAnalysis.income),
        _buildExpensesSection(
            'Expenses Analysis', supp, CurrentAnalysis.expenses),
        _buildAllCategoriesSection(
            'All Categories', supp, CurrentAnalysis.all_categories)
      ],
    );
  }

  _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/reports.png',
            height: 100.dh,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20.dh),
          AppText(
            'There is no much information to create the reports. Only one record is required.',
            size: 14.dw,
            color: AppColors.onBackground2,
            alignment: TextAlign.center,
          )
        ],
      ),
    );
  }

  _buildAllCategoriesSection(String title, ReportsPageSupplements supp,
      CurrentAnalysis sectionAnalysis) {
    final isSelected = supp.currentAnalysis == sectionAnalysis;
    final incomeList =
        supp.records.where((e) => e.category.type == kIncome).toList();
    final expensesList =
        supp.records.where((e) => e.category.type == kExpense).toList();

    return Container(
      color: !isSelected ? Colors.transparent : AppColors.surface,
      margin: EdgeInsets.only(bottom: 15.dh),
      padding: isSelected ? EdgeInsets.symmetric(vertical: 15.dh) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title, supp, sectionAnalysis),
          incomeList.isNotEmpty && isSelected
              ? _buildCategoriesTitle(
                  'income',
                  const Color(0xffFF6675),
                )
              : Container(),
          isSelected ? _buildList(incomeList) : Container(),
          expensesList.isNotEmpty && isSelected
              ? _buildCategoriesTitle(
                  'expenses',
                  const Color(0xff6E71D8),
                )
              : Container(),
          isSelected ? _buildList(expensesList) : Container(),
        ],
      ),
    );
  }

  _buildCategoriesTitle(String title, Color color) {
    return Padding(
      padding: EdgeInsets.only(left: 15.dw, top: 10.dh),
      child: AppText(
        title.toUpperCase(),
        size: 14.dw,
        color: color,
        weight: FontWeight.bold,
      ),
    );
  }

  _buildList(List<Record> recordList) {
    if (recordList.isEmpty) return Container();

    return Column(
      children: recordList
          .map((e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.dw),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(right: 15.dw),
                          child: AppText(
                            e.category.title,
                            size: 14.dw,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      AppText(e.getAmount, size: 14.dw, family: kFontFam2)
                    ]),
              ))
          .toList(),
    );
  }

  _buildSoFarSection(String title, ReportsPageSupplements supp,
      CurrentAnalysis sectionAnalysis) {
    final isSelected = supp.currentAnalysis == sectionAnalysis;

    return Container(
      color: !isSelected ? Colors.transparent : AppColors.surface,
      margin: EdgeInsets.only(bottom: 15.dh),
      padding: isSelected ? EdgeInsets.symmetric(vertical: 15.dh) : null,
      child: Column(
        children: [
          _buildSectionTitle(title, supp, sectionAnalysis),
          isSelected
              ? PieChart(
                  income: supp.totalRecords.totalIncome,
                  expenses: supp.totalRecords.totalExpenses,
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

    if (list.isEmpty) return Container();

    return Container(
      color: !isSelected ? Colors.transparent : AppColors.surface,
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
                                    lineColor: AppColors.onBackground,
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

    if (list.isEmpty) return Container();

    return Container(
      color: !isSelected ? Colors.transparent : AppColors.surface,
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
                              lineColor: AppColors.onBackground,
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
            iconColor: AppColors.primary,
          ),
          SizedBox(width: 10.dw),
          AppText(
            title.toUpperCase(),
            family: kFontFam2,
            size: 15.dw,
            color:
                isSelected ? AppColors.onBackground : AppColors.onBackground2,
          ),
        ],
      ),
    );
  }
}
