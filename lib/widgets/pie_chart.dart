import 'dart:math';
import '../source.dart';

class PieChart extends StatelessWidget {
  const PieChart({required this.income, required this.expenses, Key? key})
      : super(key: key);

  final double income, expenses;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.dh),
            child: CustomPaint(
              size: Size(330.dw, 200.dh),
              painter: PieChartPainter(income / (income + expenses)),
            ),
          ),
          _buildInterpretation()
        ],
      ),
    );
  }

  _buildInterpretation() {
    final total = expenses + income;
    final incomeRatio = (income / total) * 100;
    final expensesRatio = (expenses / total) * 100;
    final balanceRatio = incomeRatio - expensesRatio;
    final balance = income - expenses;

    return Padding(
      padding: EdgeInsets.only(top: 15.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText('KEY', size: 18.dw, color: AppColors.onBackground),
          _intepretation(
            'Income',
            Utils.convertToMoneyFormat(income),
            incomeRatio.toStringAsFixed(2),
            const Color(0xffFF6675),
          ),
          _intepretation(
            'Expenses',
            Utils.convertToMoneyFormat(expenses),
            expensesRatio.toStringAsFixed(2),
            const Color(0xff6E71D8),
          ),
          _intepretation(
            'Balance',
            Utils.convertToMoneyFormat(balance),
            balanceRatio.toStringAsFixed(2),
            Colors.transparent,
          ),
        ],
      ),
    );
  }

  _intepretation(String title, String value, String percent, Color color) {
    return SizedBox(
      width: 360.dw,
      height: 25.dh,
      child: Row(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildKeyTitle(title, color),
              AppText(
                percent + ' % ',
                size: 15.dw,
                color: AppColors.onBackground,
              )
            ],
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Currency(color: AppColors.onBackground),
                Container(
                    alignment: Alignment.centerRight,
                    child: AppText(
                      value,
                      size: 15.dw,
                      color: AppColors.onBackground,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyTitle(String title, Color keyColor) {
    return Row(children: [
      Container(
        height: 15.dw,
        width: 15.dw,
        color: keyColor,
        margin: EdgeInsets.only(right: 10.dw),
      ),
      AppText(title, size: 16.dw, color: AppColors.onBackground),
    ]);
  }
}

class PieChartPainter extends CustomPainter {
  PieChartPainter(this.incomeRatio);
  final double incomeRatio;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final rectPaint = Paint()..color = Colors.transparent;
    final paint = Paint()..color = const Color(0xffFF6675);
    final _paint = Paint()..color = const Color(0xff6E71D8);
    final __paint = Paint()..color = AppColors.background;

    final center = Offset(width / 2, height / 2);
    final radius = min(width / 2, height / 2);
    final arcRect = Rect.fromCircle(center: center, radius: radius);
    final rect = Rect.fromCenter(center: center, width: width, height: height);

    canvas.drawRect(rect, rectPaint);
    canvas.drawCircle(center, radius, _paint);
    canvas.drawArc(arcRect, -pi * 1.5, 2 * pi * incomeRatio, true, paint);
    canvas.drawCircle(center, radius * .6, __paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
