import '../source.dart';

class BarChart extends StatelessWidget {
  const BarChart(
      {required this.value,
      required this.valueColor,
      required this.lineColor,
      required this.title,
      super.key});

  final double value;
  final String title;
  final Color valueColor, lineColor;

  @override
  Widget build(BuildContext context) {
    final data = (value * 100).round();

    return Container(
      height: 280.dh,
      width: 50.dw,
      margin: EdgeInsets.symmetric(vertical: 15.dh, horizontal: 5.dw),
      child: Column(
        children: [
          AppText('$data%', size: 14.dw, family: kFontFam2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RotatedBox(
                  quarterTurns: 3,
                  child: AppText(
                    title,
                    size: 14.dw,
                    maxLines: 1,
                  )),
              SizedBox(
                  height: 230.dh,
                  width: 20.dw,
                  child: CustomPaint(
                      painter: BarPainter(
                    value,
                    valueColor,
                    lineColor,
                  ))),
            ],
          ),
        ],
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  BarPainter(this.value, this.valueColor, this.lineColor);
  final double value;
  final Color valueColor;
  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final rect = Rect.fromLTWH(0, height, width, -height * value);
    final paint = Paint()..color = valueColor;
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2;

    final p1 = Offset(width / 2, height);
    final p2 = Offset(width / 2, 0);

    canvas.drawLine(p1, p2, linePaint);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
