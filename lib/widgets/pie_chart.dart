import 'dart:math';
import '../source.dart';

class PieChart extends StatelessWidget {
  const PieChart(
      {required this.incomeRatio,
      required this.backgroundColor,
      required this.textColor,
      required this.backgroundColor2,
      Key? key})
      : super(key: key);

  final double incomeRatio;
  final Color backgroundColor, textColor, backgroundColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            size: Size(330.dw, 200.dh),
            painter: PieChartPainter(
              incomeRatio,
              backgroundColor,
              backgroundColor2,
              textColor,
            ),
          ),
          _buildInterpretation()
        ],
      ),
    );
  }

  _buildInterpretation() {
    return Padding(
      padding: EdgeInsets.only(top: 15.dh),
      child: Column(
        children: [
          AppText('KEY', size: 18.dw, color: backgroundColor2),
          _intepretation('Income', '30,000', const Color(0xffFF6675)),
          _intepretation('Expenses', '25,500', const Color(0xff6E71D8)),
        ],
      ),
    );
  }

  _intepretation(String title, String value, Color color) {
    return SizedBox(
      width: 180.dw,
      height: 25.dh,
      child: Row(
        children: [
          Container(
            height: 15.dw,
            width: 15.dw,
            color: color,
            margin: EdgeInsets.only(right: 10.dw),
          ),
          AppText(title, size: 16.dw, color: backgroundColor2),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: AppText(
                  value,
                  size: 16.dw,
                  color: backgroundColor2,
                )),
          ),
        ],
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  PieChartPainter(
    this.incomeRatio,
    this.backgroundColor,
    this.backgroundColor2,
    this.textColor,
  );
  final double incomeRatio;
  final Color backgroundColor, textColor, backgroundColor2;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final rectPaint = Paint()..color = Colors.transparent;
    final paint = Paint()..color = const Color(0xffFF6675);
    final _paint = Paint()..color = const Color(0xff6E71D8);
    final __paint = Paint()..color = backgroundColor;
    final _smallCirclesPaint = Paint()..color = backgroundColor2;

    final center = Offset(width / 2, height / 2);
    final radius = min(width / 2, height / 2);
    final arcRect = Rect.fromCircle(center: center, radius: radius);
    final rect = Rect.fromCenter(center: center, width: width, height: height);

    final center1 = Offset(width * .2, height * .35);
    final center2 = Offset(width * .8, height * .74);

    final center3 = Offset(width * .15, height * .3);
    final center4 = Offset(width * .75, height * .7);

    final textPainter = TextPainter(
      text: TextSpan(
          text: '20 %',
          style: TextStyle(
            fontFamily: kFontFam,
            fontSize: 16.dw,
            color: textColor,
          )),
      textDirection: TextDirection.ltr,
    );
    final textPainter2 = TextPainter(
      text: TextSpan(
          text: '80 %',
          style: TextStyle(
            fontFamily: kFontFam,
            fontSize: 16.dw,
            color: textColor,
          )),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    canvas.drawRect(rect, rectPaint);
    canvas.drawCircle(center, radius, _paint);
    canvas.drawArc(arcRect, -pi * 1.5, 2 * pi * incomeRatio, true, paint);
    canvas.drawCircle(center, radius * .6, __paint);
    canvas.drawCircle(center1, 30.dw, _smallCirclesPaint);
    canvas.drawCircle(center2, 30.dw, _smallCirclesPaint);
    textPainter.paint(canvas, center3);
    textPainter2.paint(canvas, center4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
