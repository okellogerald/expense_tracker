import 'package:flutter/widgets.dart';

class CurrencyIcons {
  CurrencyIcons._();

  static const _kFontFam = 'CurrencyIcons';
  static const String? _kFontPkg = null;

  static const IconData euro = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData franc = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData franc_2 = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData krone = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData lira = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pound = IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData rand = IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData rupee = IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData shekel = IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData yen = IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData shilling = IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData dollar = IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData dram = IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static IconData getIcon(int codePoint) =>
      IconData(codePoint, fontFamily: 'CurrencyIcons', fontPackage: null);
}
