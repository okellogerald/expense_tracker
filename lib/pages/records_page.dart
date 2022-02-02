import '../../source.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  late final RecordsPageBloc bloc;
  late final RecordsService recordsService;
  late final PreferencesService prefsService;
  late final GrossAmountsService grossAmountsService;

  @override
  void initState() {
    recordsService = Provider.of<RecordsService>(context, listen: false);
    prefsService = Provider.of<PreferencesService>(context, listen: false);
    grossAmountsService =
        Provider.of<GrossAmountsService>(context, listen: false);
    bloc = RecordsPageBloc(recordsService, prefsService, grossAmountsService);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  _buildBody() {
    return BlocBuilder<RecordsPageBloc, RecordsPageState>(
        bloc: bloc,
        builder: (_, state) {
          return state.when(
            loading: _buildLoading,
            content: _buildContent,
            success: _buildContent,
          );
        });
  }

  Widget _buildLoading(
      List<Record> recordsList, RecordsPageSupplements supplements) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(
      List<Record> recordsList, RecordsPageSupplements supplements) {
    return AppListView(
      backgroundColor: AppColors.background,
      appBarDisapperingWidget: (value) => _buildTitle1(value, supplements),
      appBarRemainingWidget: () => _buildTitle2(supplements),
      listWidget: recordsList.isEmpty
          ? _buildEmptyList()
          : _buildRecords(recordsList, supplements),
    );
  }

  Widget _buildTitle1(double value, RecordsPageSupplements supp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: AppText(
            '${Utils.getCurrentMonth()}, ${Utils.getCurrentYear()}',
            color: AppColors.onBackground,
            size: value,
            family: kFontFam2,
          ),
        ),
        AppIconButton(
          icon: Icons.settings,
          iconSize: value,
          iconColor: AppColors.primary,
          onPressed: () => SettingsPage.navigateTo(context),
        ),
      ],
    );
  }

  Widget _buildTitle2(RecordsPageSupplements supplements) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBudgetAmount('Income', supplements.totalRecords.getIncome),
        _buildBudgetAmount('Expenses', supplements.totalRecords.getExpenses),
        _buildBudgetAmount('Balance', supplements.totalRecords.getBalance),
      ],
    );
  }

  _buildEmptyList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/records.png',
            height: 80.dh,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20.dh),
          AppText('Records you add will be viewed from this page.',
              color: AppColors.onBackground2, size: 15.dw)
        ],
      ),
    );
  }

  _buildRecords(List<Record> recordsList, RecordsPageSupplements supplements) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 90.dh, top: 150.dh),
      itemBuilder: (context, i) {
        final index = Utils.getDaysInMonth() - i + 1;
        final recordList =
            recordsList.where((e) => e.date.day == index).toList();
        return _buildDayRecords(recordList, index, supplements);
      },
      itemCount: Utils.getDaysInMonth(),
    );
  }

  Widget _buildDayRecords(
      List<Record> recordList, int day, RecordsPageSupplements supplements) {
    final ordinal = Utils.getOrdinalsFrom(day);
    var weekDay = '';
    if (recordList.isNotEmpty) {
      weekDay = Utils.getWeekDay(recordList.first.date.weekday);
    }
    final isSelected = day == supplements.day;
    final hasTotals = supplements.withTotalsDays.contains(day);

    return recordList.isEmpty
        ? Container()
        : Padding(
            padding: EdgeInsets.only(bottom: 40.dh),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DayText(
                      '$day$ordinal, $weekDay',
                      day: day,
                      cancelCallback: bloc.updateDay,
                      isSelected: isSelected,
                      hasTotals: hasTotals,
                      showTotalsCallback: !hasTotals
                          ? bloc.showWithDayTotals
                          : bloc.removeFromWithDayTotals,
                    ),
                    !isSelected
                        ? Padding(
                            padding:
                                EdgeInsets.only(right: 15.dw, bottom: 5.dh),
                            child: AppIconButton(
                              onPressed: () => bloc.updateDay(day),
                              icon: Icons.more_horiz,
                              iconColor: AppColors.onBackground,
                              spreadRadius: 25.dw,
                            ),
                          )
                        : Container()
                  ],
                ),
                Container(
                  color: AppColors.surface,
                  child: Column(
                    children: recordList
                        .map((e) => RecordTile(
                              e,
                              cancelCallback: bloc.updateId,
                              editCallback: () => RecordsEditPage.navigateTo(
                                  context,
                                  record: e),
                              deleteCallback: bloc.delete,
                              isSelected: e.id == supplements.id,
                              onTap: bloc.updateId,
                            ))
                        .toList(),
                  ),
                ),
                supplements.withTotalsDays.contains(day)
                    ? _buildDayTotals(supplements, day)
                    : Container(),
              ],
            ),
          );
  }

  _buildDayTotals(RecordsPageSupplements supp, int day) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 5.dh),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColors.divider, width: 2.dw))),
      child: Column(
        children: [
          _buildTotals('Total Income', supp.getIncomeTotal(day), true),
          _buildTotals('Total Expenses', supp.getExpensesTotal(day), false),
        ],
      ),
    );
  }

  _buildTotals(String title, String amount, bool isIncome) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          size: 14.dw,
          isBolded: true,
        ),
        Row(
          children: [
            Currency(color: isIncome ? AppColors.positive : AppColors.negative),
            AppText(
              amount,
              size: 14.dw,
              color: AppColors.positive,
              family: kFontFam2,
              isBolded: true,
            ),
          ],
        ),
      ],
    );
  }

  _buildBudgetAmount(String text, String amount) {
    final isExpense = text == 'Expenses';

    return Container(
      width: 125.dw,
      padding: EdgeInsets.symmetric(vertical: 5.dh),
      alignment: Alignment.center,
      color: AppColors.tertiary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text.toUpperCase(),
              size: 15.dw, color: AppColors.onBackground2),
          SizedBox(height: 5.dh),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Currency(
                  color: isExpense ? AppColors.negative : AppColors.positive),
              AppText(amount,
                  size: 13.dw,
                  isBolded: true,
                  family: kFontFam2,
                  color: !isExpense ? AppColors.positive : AppColors.negative),
            ],
          )
        ],
      ),
    );
  }

  _buildFloatingActionButton() {
    return AppIconButton(
      onPressed: () => RecordsEditPage.navigateTo(context),
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
