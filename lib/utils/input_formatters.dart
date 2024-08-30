import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String getFormattedTINNumber(String value) {
  final text = value.trim().split("-").join();

  final parts = <String>[];
  for (var i = 0; i < text.length; i += 4) {
    final part = text.substring(i, min(i + 4, text.length));
    parts.add(part);
  }
  return parts.join("-");
}

/// Is intended to work along with [OnlyIntegerFormatter]
class TINNumberFormatter extends TextInputFormatter {
  const TINNumberFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;
    final text = newValue.text.trim().split("-").join();
    final newText = getFormattedTINNumber(text);
    return newValue.copyWith(
      text: newText,
      selection:
          TextSelection.fromPosition(TextPosition(offset: newText.length)),
    );
  }
}

/// Makes sure every first letter in a sentence is uppercased.
class OnlyIntegerFormatter extends TextInputFormatter {
  const OnlyIntegerFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;
    final numeric = RegExp(r'^[0-9]+$');
    if (numeric.hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

class FixedLengthFormatter extends TextInputFormatter {
  final int length;
  const FixedLengthFormatter(this.length);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > length) return oldValue;
    return newValue;
  }
}

/// Makes sure every first letter in a sentence is uppercased.
class OTPFormatter extends TextInputFormatter {
  const OTPFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;
    if (newValue.text.length == 2) {
      return newValue.copyWith(
        text: newValue.text.split("").last,
        selection: const TextSelection.collapsed(offset: 1),
      );
    }
    return newValue;
  }
}

/// Makes sure every first letter in a sentence is uppercased.
class FirstLetterUppercaseFormatter extends TextInputFormatter {
  const FirstLetterUppercaseFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.trim().isNotEmpty) {
      final firstLetter = newValue.text.substring(0, 1);
      final otherLetters = newValue.text.substring(1);
      final newWord = "${firstLetter.toUpperCase()}$otherLetters";
      return newValue.copyWith(text: newWord);
    } else {
      return newValue;
    }
  }
}

/// Currency Formatter with a default symbol 'TZS'
class TZSCurrencyFormatter extends CurrencyFormatter {
  const TZSCurrencyFormatter([int decimalPts = 4])
      : super(decimalPoints: decimalPts, symbol: "TZS");
}

class CurrencyFormatter extends TextInputFormatter {
  final int decimalPoints;
  final String? symbol;
  const CurrencyFormatter({
    this.decimalPoints = 4,
    this.symbol,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.trim().isEmpty) return newValue;
    if (newValue.text.trim() == symbol?.trim()) {
      return newValue.copyWith(
          text: "",
          selection: const TextSelection.collapsed(
            offset: 0,
          ));
    }

    var onlyText = newValue.text.replaceAll(",", "");
    if (symbol != null) {
      onlyText = onlyText.replaceAll(symbol!, "");
    }

    if (num.tryParse(onlyText) == null) return oldValue;

    if (onlyText.endsWith(".")) {
      if (decimalPoints == 0) return oldValue;
      return newValue;
    }

    var numbersAfterDecimal = 0;
    if (onlyText.contains(".")) {
      numbersAfterDecimal =
          onlyText.substring(onlyText.indexOf(".") + 1).length;
    }
    if (numbersAfterDecimal > decimalPoints) return oldValue;

    final formatter = NumberFormat.currency(
      symbol: symbol != null ? "$symbol " : "",
      decimalDigits: numbersAfterDecimal,
    );
    var newText = formatter.format(num.parse(onlyText));

    final oldGroups = oldValue.text.split(",").length;
    final newGroups = newText.split(",").length;

    var offset = newValue.selection.baseOffset + newGroups - oldGroups;

    if (offset < (symbol?.length ?? 0)) {
      offset = newText.length;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: offset,
      ),
    );
  }
}

class NoSpaceFormatter extends TextInputFormatter {
  const NoSpaceFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final hasEmptySpace = newValue.text.trim() == oldValue.text;
    if (hasEmptySpace) {
      return TextEditingValue(
        text: newValue.text.trim(),
        selection: oldValue.selection,
      );
    }
    return newValue;
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  const ExpiryDateFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.length < oldValue.text.length) return newValue;

    var result = "";

    if (newText.contains("/")) {
      final dates = newText.split("/");
      final month = dates.first;
      final year = dates.last;
      if (year.length >= 2) {
        result = "$month/${year.substring(0, 2)}";
      } else {
        result = newText;
      }
    } else {
      if (newText.length == 2) {
        result = "$newText/";
      } else {
        result = newText;
      }
    }

    return newValue.copyWith(
      text: result,
      selection: TextSelection.fromPosition(
        TextPosition(offset: result.length),
      ),
    );
  }
}

class CVVFormatter extends TextInputFormatter {
  const CVVFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final length = newValue.text.length;
    if (length > 3) {
      return TextEditingValue(
        text: newValue.text.trim().substring(0, 3),
        selection: oldValue.selection,
      );
    }
    return newValue;
  }
}

class DateTextFormatter extends TextInputFormatter {
  const DateTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // const format = "dd/MM/yyyy";
    var text = newValue.text;
    if (int.tryParse(text.split("").last) == null &&
        text.split("").last != "/") {
      return oldValue;
    }

    if (text.length == 2) {
      if (num.parse(text) > 31) return oldValue;
    }
    if (text.length == 5) {
      if (num.parse(text.substring(3, 5)) > 12) return oldValue;
    }
    if (text.length == 10) {
      if (num.parse(text.substring(6, 10)) > DateTime.now().year) {
        return oldValue;
      }
    }
    if (text.length == 2 || text.length == 5) {
      text += "/";
    }
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(
        offset:
            newValue.selection.baseOffset + text.length - newValue.text.length,
      ),
    );
  }
}
