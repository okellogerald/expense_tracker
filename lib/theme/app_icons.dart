import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  static const _kFontFam = 'AppIcons';
  static const String? _kFontPkg = null;

  static const IconData award =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData book =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData coupon =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData education =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData electronics =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData home =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData shopping =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData travel =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData airplane =
      IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData rent =
      IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static IconData fromCodePoint(int codePoint) =>
      IconData(codePoint, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
