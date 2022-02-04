import 'package:hive/hive.dart';

import '../source.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  late final int currency;

  @override
  void initState() {
    final user = Hive.box(kUser).get(kUser) as User;
    currency = user.currencyCodePoint;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.dw),
      child: Icon(CurrencyIcons.getIcon(currency),
          color: widget.color, size: 12.dw),
    );
  }
}
