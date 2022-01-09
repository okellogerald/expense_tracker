import '../source.dart';

class BarChart extends StatelessWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: CustomPaint(painter: BarPainter()),
    );
  }
}

class BarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, 30, size.height);
    final rect2 = Rect.fromLTWH(0, 0, 30, size.height * .65);
    final paint = Paint()..color = Colors.white;
    final paint2 = Paint()..color = Colors.blue;

    final textPainter = TextPainter(
      text: TextSpan(
          text: '20 %',
          style: TextStyle(
              fontFamily: 'Louis', fontSize: 12.dw, color: Colors.black)),
      textDirection: TextDirection.ltr,
    );
    final textPainter2 = TextPainter(
      text: TextSpan(
          text: '80 %',
          style: TextStyle(
              fontFamily: 'Louis', fontSize: 12.dw, color: Colors.black)),
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
    final xCenter = (30 - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height);
    final yCenter2 = (size.height * .65 - textPainter.height);
    final offset = Offset(xCenter, yCenter);
    final offset2 = Offset(xCenter, yCenter2);

    canvas.drawRect(rect, paint);
    canvas.drawRect(rect2, paint2);
    textPainter.paint(canvas, offset);
    textPainter2.paint(canvas, offset2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
