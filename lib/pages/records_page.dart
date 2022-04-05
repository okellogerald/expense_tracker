import '../../source.dart';
import '../utils/navigation_logic.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  late final RecordsPageBloc bloc;

  @override
  void initState() {
    var recordsService = Provider.of<RecordsService>(context, listen: false);
    var prefsService = Provider.of<PreferencesService>(context, listen: false);
    var grossAmountsService =
        Provider.of<GrossAmountsService>(context, listen: false);
    bloc = RecordsPageBloc(recordsService, prefsService, grossAmountsService);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(), floatingActionButton: _buildFloatingActionButton());
  }

  _buildBody() {
    return BlocBuilder<RecordsPageBloc, RecordsPageState>(
        bloc: bloc,
        builder: (_, state) {
          return state.when(
              loading: _buildLoading,
              content: _buildContent,
              success: _buildContent);
        });
  }

  Widget _buildLoading(
          List<Record> recordsList, RecordsPageSupplements supplements) =>
      const AppLoadingIndicator();

  Widget _buildContent(
      List<Record> recordsList, RecordsPageSupplements supplements) {
    return AppListView(
      backgroundColor: AppColors.background,
      appBarDisapperingWidget: (value) =>
          _buildDateSettingsTitle(value, supplements),
      appBarRemainingWidget: () => _buildBalances(supplements),
      listWidget: recordsList.isEmpty
          ? _buildEmptyList()
          : _buildRecords(recordsList, supplements),
    );
  }

  Widget _buildDateSettingsTitle(double value, RecordsPageSupplements supp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
            child: AppText(
                '${Utils.getCurrentMonth()}, ${Utils.getCurrentYear()}',
                color: AppColors.onBackground,
                size: value,
                family: kFontFam2)),
        AppIconButton(
            icon: Icons.settings,
            iconSize: value,
            iconColor: AppColors.primary,
            onPressed: /* () => SettingsPage.navigateTo(context) */ () {}),
      ],
    );
  }

  Widget _buildBalances(RecordsPageSupplements supplements) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _buildBalance('Income', supplements.totalRecords.totalIncome),
      SizedBox(width: 10.dw),
      _buildBalance('Expenses', supplements.totalRecords.totalExpenses),
      SizedBox(width: 10.dw),
      _buildBalance('Balance', supplements.totalRecords.balance)
    ]);
  }

  _buildEmptyList() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.dw),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/records.png',
              height: 80.dh, fit: BoxFit.contain),
          SizedBox(height: 20.dh),
          AppText('Records you add will be viewed from this page.',
              color: AppColors.onBackground2, size: 15.dw)
        ]));
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
        itemCount: Utils.getDaysInMonth());
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
                      DayText('$day$ordinal, $weekDay',
                          day: day,
                          cancelCallback: bloc.updateDay,
                          isSelected: isSelected,
                          hasTotals: hasTotals,
                          showTotalsCallback: !hasTotals
                              ? bloc.showWithDayTotals
                              : bloc.removeFromWithDayTotals),
                      !isSelected
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: 15.dw, bottom: 5.dh),
                              child: AppIconButton(
                                  onPressed: () => bloc.updateDay(day),
                                  icon: Icons.more_horiz,
                                  iconColor: AppColors.onBackground,
                                  spreadRadius: 25.dw))
                          : Container()
                    ]),
                ClipRRect(
                  borderRadius: borderRadius2,
                  child: Container(
                      color: AppColors.surface,
                      child: Column(
                          children: recordList
                              .map((e) => RecordTile(e,
                                  cancelCallback: bloc.updateId,
                                  editCallback: () =>
                                      push(RecordsEditPage(record: e)),
                                  deleteCallback: bloc.delete,
                                  isSelected: e.id == supplements.id,
                                  onTap: bloc.updateId))
                              .toList())),
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
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 5.dh),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.divider, width: 2.dw))),
        child: Column(children: [
          _buildTotals('Total Income', supp.getIncomeTotal(day), true),
          _buildTotals('Total Expenses', supp.getExpensesTotal(day), false)
        ]));
  }

  _buildTotals(String title, String amount, bool isIncome) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppText(title, size: 14.dw, isBolded: true),
      AppText(amount,
          size: 14.dw,
          color: AppColors.positive,
          family: kFontFam2,
          isBolded: true)
    ]);
  }

  _buildBalance(String text, double amount) {
    final isOutflow = text == 'Expenses' || amount.isNegative;
    final formattedAmount = Utils.convertToMoneyFormat(amount);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.dh),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.tertiary, borderRadius: borderRadius2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text, size: 14.dw, color: AppColors.onBackground2),
            SizedBox(height: 5.dh),
            AppText(formattedAmount,
                size: 13.dw,
                isBolded: true,
                family: kFontFam3,
                color: !isOutflow ? AppColors.positive : AppColors.negative)
          ],
        ),
      ),
    );
  }

  _buildFloatingActionButton() {
    return AppIconButton(
        onPressed: () => push(const RecordsEditPage()),
        buttonColor: AppColors.primary,
        icon: Icons.add,
        iconColor: AppColors.onPrimary,
        height: 55.dw,
        width: 55.dw,
        spreadRadius: 30.dw,
        iconSize: 30.dw);
  }
}
