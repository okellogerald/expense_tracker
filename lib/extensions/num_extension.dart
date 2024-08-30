import 'package:intl/intl.dart';

extension DoubleCurrencyExt on num {
  String formatCurrency({int decimals = 0}) =>
      NumberFormat.currency(decimalDigits: decimals, symbol: "TZS ")
          .format(this);
}
