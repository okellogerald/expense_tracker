import '../../source.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              _buildTitle(),
              _buildContent(),
            ],
          ),
        )
      ],
    );
  }

  _buildTitle() {
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
              _buildBudgetAmount('Income', 20000),
              _buildBudgetAmount('Budget', 20000),
              _buildBudgetAmount('Expenses', 10000, isExpense: true),
            ],
          )
        ],
      ),
    );
  }

  _buildContent() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.speaker_notes_off, color: Colors.white54),
          SizedBox(height: 20.dh),
          AppText('Records you add shall be added here.',
              color: AppColors.textColor3, size: 14.dw)
        ],
      ),
    );
  }

  _buildBudgetAmount(String text, int amount, {bool isExpense = false}) {
    final formatted = Utils.convertToMoneyFormat(amount);

    return Container(
      width: 125.dw,
      padding: EdgeInsets.symmetric(vertical: 5.dh),
      alignment: Alignment.center,
      color: AppColors.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text.toUpperCase(), size: 15.dw, color: AppColors.textColor2),
          AppText(formatted,
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
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.black, size: 30.dw));
  }

}
