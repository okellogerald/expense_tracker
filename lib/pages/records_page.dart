import '../../source.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

///todo: 
///on the day row widget, the horizontal is pressed so as to ask the user whether 
///to show more data based on the single days expenditure and income.
///
///the records, all of them should have an id, that i can distinguish them 
///against each other, and I think you should add notes functionality, so that 
///you will have four buttons when the record tile is clicked.
///The more button, for more info on when the record was created and notes on the 
///far left, where on the far right, functions for editing, deleting and canceling.


class _RecordsPageState extends State<RecordsPage> {
  late final RecordsPageBloc bloc;
  late final RecordsService recordsService;
  late final CategoriesService categoriesService;

  @override
  void initState() {
    recordsService = Provider.of<RecordsService>(context, listen: false);
    categoriesService = Provider.of<CategoriesService>(context, listen: false);
    bloc = RecordsPageBloc(recordsService, categoriesService);
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
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              _buildTitle(supplements),
              _buildRecords(recordsList),
            ],
          ),
        )
      ],
    );
  }

  _buildTitle(RecordsPageSupplements supplements) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.dw, 30.dh, 10.dw, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('December, 2021',
                  color: AppColors.textColor, size: 22.dw),
              AppIconButton(
                icon: Icons.settings,
                iconSize: 24.dw,
                iconColor: AppColors.primaryColor,
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 12.dh),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBudgetAmount('Income', supplements.totalRecords.getIncome),
              _buildBudgetAmount('Budget', supplements.totalRecords.getBudget),
              _buildBudgetAmount(
                  'Expenses', supplements.totalRecords.getExpenses),
            ],
          )
        ],
      ),
    );
  }

  _buildRecords(List<Record> recordsList) {
    return recordsList.isEmpty
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.speaker_notes_off, color: Colors.white54),
                SizedBox(height: 20.dh),
                AppText('Records you add shall be added here.',
                    color: AppColors.textColor3, size: 14.dw)
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
                itemCount: Utils.getDaysInMonth(),
                padding: EdgeInsets.only(
                    left: 15.dw, right: 15.dw, top: 30.dh, bottom: 90.dh),
                itemBuilder: (_, i) {
                  final index = i + 1;
                  final recordList =
                      recordsList.where((e) => e.date.day == index).toList();
                  return _buildDayRecords(recordList, index);
                }));
  }

  Widget _buildDayRecords(List<Record> recordList, int day) {
    return recordList.isEmpty
        ? Container()
        : Padding(
            padding: EdgeInsets.only(bottom: 15.dw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('${day}th, Sunday',
                        color: AppColors.textColor2, size: 18.dw),
                    AppIconButton(
                      onPressed: () {},
                      icon: Icons.more_horiz,
                      iconColor: Colors.white70,
                      spreadRadius: 25.dw,
                    )
                  ],
                ),
                Divider(height: 1.5.dw, color: AppColors.dividerColor),
                SizedBox(height: 10.dh),
                Column(
                  children: recordList.map((e) => RecordTile(e)).toList(),
                ),
              ],
            ),
          );
  }

  _buildBudgetAmount(String text, String amount) {
    final isExpense = text == 'Expenses';

    return Container(
      width: 125.dw,
      padding: EdgeInsets.symmetric(vertical: 5.dh),
      alignment: Alignment.center,
      color: AppColors.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text.toUpperCase(), size: 15.dw, color: AppColors.textColor2),
          AppText(amount,
              size: 13.dw,
              color: !isExpense ? AppColors.positive : AppColors.negative)
        ],
      ),
    );
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
