import '_common_imports.dart';

class AmountText extends StatelessWidget {
  final num amount;
  final Color? color;
  const AmountText(this.amount, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return AppText.bodyMedium(
      context,
      amount.formatted,
      fontFamily: "Ojuju",
      weight: FontWeight.w600,
      color: color,
    );
  }
}
