import 'package:intl/intl.dart';

final tzsFormatter = NumberFormat.currency(symbol: "TZS ", decimalDigits: 0);

final compactTZSFormatter =
    NumberFormat.compactCurrency(symbol: "TZS ", decimalDigits: 0);

extension DoubleExt on num {
  String get compactlyFormatted {
    return NumberFormat.compactCurrency(decimalDigits: 4, symbol: "")
        .format(this);
  }

  String get formatted {
    return NumberFormat.currency(symbol: "", decimalDigits: 4).format(this);
  }

  String get tzsFormatted {
    return NumberFormat.currency(symbol: "TZS ", decimalDigits: 2).format(this);
  }

  String format({
    bool compact = true,
    int decimalDigits = 4,
    String symbol = "TZS",
  }) {
    final formatter = NumberFormat.currency(
      symbol: "$symbol ",
      decimalDigits: decimalDigits,
    );

    final compactFormatter = NumberFormat.compactCurrency(
      symbol: "$symbol ",
      decimalDigits: decimalDigits,
    );

    if (compact) {
      return compactFormatter.format(this);
    }

    return formatter.format(this);
  }
}
