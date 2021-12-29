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

  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  final scrollNotificationNotifier = ValueNotifier<double>(0.0);

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

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
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        scrollNotificationNotifier.value = notification.metrics.pixels.dh;
        return true;
      },
      child: CustomScrollView(
        slivers: [
          _buildTitles(supplements),
          recordsList.isEmpty
              ? _buildEmptyList()
              : _buildRecords(recordsList, supplements)
        ],
      ),
    );
  }

  _buildTitles(RecordsPageSupplements supplements) {
    return SliverAppBar(
      backgroundColor: appColors.backgroundColor,
      title: ValueListenableBuilder<double>(
          valueListenable: scrollNotificationNotifier,
          builder: (context, scrollValue, snapshot) {
            return AppText(
              'December, 2021',
              family: 'Gramatika',
              color:
                  scrollValue > 40 ? Colors.transparent : appColors.textColor,
              size: 24.dw,
            );
          }),
      actions: [
        AppIconButton(
          icon: Icons.settings,
          margin: EdgeInsets.only(right: 15.dw),
          iconSize: 24.dw,
          iconColor: appColors.primaryColor,
          onPressed: () => SettingsPage.navigateTo(context),
        )
      ],
      pinned: true,
      floating: true,
      snap: true,
      toolbarHeight: 40.dh,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(45.dh),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.dw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBudgetAmount('Income', supplements.totalRecords.getIncome),
              _buildBudgetAmount(
                  'Expenses', supplements.totalRecords.getExpenses),
              _buildBudgetAmount(
                  'Balance', supplements.totalRecords.getBalance),
            ],
          ),
        ),
      ),
    );
  }

  _buildEmptyList() {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.speaker_notes_off, color: appColors.iconColor),
          SizedBox(height: 20.dh),
          AppText('Records you add shall be added here.',
              color: appColors.textColor3, size: 14.dw)
        ],
      ),
    );
  }

  _buildRecords(List<Record> recordsList, RecordsPageSupplements supplements) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 90.dh, top: 20.dh),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            final index = Utils.getDaysInMonth() - i + 1;
            final recordList =
                recordsList.where((e) => e.date.day == index).toList();
            return _buildDayRecords(recordList, index, supplements);
          },
          childCount: Utils.getDaysInMonth(),
        ),
      ),
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
                              iconColor: appColors.iconColor,
                              spreadRadius: 25.dw,
                            ),
                          )
                        : Container()
                  ],
                ),
                Container(
                  color: appColors.backgroundColor2,
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

  _buildDayTotals(RecordsPageSupplements supplements, int day) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 5.dh),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: appColors.dividerColor, width: 2.dw))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Total Income',
                size: 14.dw,
                family: kFontFam2,
              ),
              AppText(
                supplements.getIncomeTotal(day),
                size: 14.dw,
                color: appColors.positiveColor,
                family: kFontFam2,
                isBolded: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Total Expenses',
                size: 14.dw,
                family: kFontFam2,
              ),
              AppText(
                supplements.getExpensesTotal(day),
                size: 14.dw,
                color: appColors.negativeColor,
                family: kFontFam2,
                isBolded: true,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildBudgetAmount(String text, String amount) {
    final isExpense = text == 'Expenses';

    return ValueListenableBuilder<double>(
        valueListenable: scrollNotificationNotifier,
        builder: (context, scrollValue, snapshot) {
          return Container(
            width: 125.dw,
            padding: EdgeInsets.symmetric(vertical: 5.dh),
            alignment: Alignment.center,
            color: appColors.secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text.toUpperCase(),
                    size: 15.dw,
                    color: scrollValue > 40
                        ? appColors.textColor
                        : appColors.textColor2),
                AppText(amount,
                    size: 13.dw,
                    family: kFontFam2,
                    isBolded: true,
                    color: !isExpense
                        ? appColors.positiveColor
                        : appColors.negativeColor)
              ],
            ),
          );
        });
  }

  /* 
  _buildCircularIndicator() {
    return AppCircularStepIndicator(
      width: 60.dw,
      height: 60.dw,
      stepWidth: 3.5,
      stepColor: AppColors.accentColor,
      fillColor: AppColors.backgroundColor,
      child: AppText(
        '-30%',
        size: 12.dw,
      ),
    );
  } */

  _buildFloatingActionButton() {
    return AppIconButton(
      onPressed: () => RecordsEditPage.navigateTo(context),
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
