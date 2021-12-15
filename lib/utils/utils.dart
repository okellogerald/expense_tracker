import 'package:budgetting_app/widgets/screen_size_config.dart';

extension SizeExtension on num {
  // ignore: unused_element
  double get dw => ScreenSizeConfig.getDoubleWidth(this);
  double get dh => ScreenSizeConfig.getDoubleHeight(this);
}

class Utils {
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
