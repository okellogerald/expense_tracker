import 'package:budgetting_app/widgets/screen_size_config.dart';

extension SizeExtension on num {
  // ignore: unused_element
  double get dw => ScreenSizeConfig.getDoubleWidth(this);
  double get dh => ScreenSizeConfig.getDoubleHeight(this);
}

class Utils {
  static _leapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  static int getDaysInMonth() {
    final monthLength = <int>[31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    final date = DateTime.now();

    if (_leapYear(date.year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[date.month - 1];
  }

/* 
  ///date-time format example : 2021-12-23 20:23:25.094181
  ///required is that 23, as a day in the 12th month of 2021
  static int convertToDayFrom(String dateTime) {
    return dateTime.substring(start);
  }
 */
  static String convertToMoneyFormat(int number) {
    final pieces = <String>[];
    String stringVersion = number.toString();

    for (int i = 0; i < stringVersion.length / 3; i++) {
      final length = stringVersion.length;

      if (length > 3) {
        final added = stringVersion.substring(length - 3, length);
        pieces.add(added);
        stringVersion = stringVersion.substring(0, length - 3);
      }
    }

    pieces.add(stringVersion);

    if (pieces.length == 1) return pieces.first.toString() + '.00';

    final reversedList = pieces.reversed.toList();
    String money = '';
    for (int i = 0; i < reversedList.length; i++) {
      final v = reversedList[i];
      money = i == reversedList.length - 1 ? money + v : money + v + ',';
    }

    return money + '.00';
  }
}
