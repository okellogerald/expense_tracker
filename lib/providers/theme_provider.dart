import '../source.dart';

class ThemeProvider extends ChangeNotifier {
  String _theme = 'Dark';

  void changeThemeTo(String theme) {
    if (_theme == 'Dark') {
      _theme = 'Light';
    } else {
      _theme = 'Dark';
    }
    notifyListeners();
  }

  String get getCurrentTheme => _theme;
}
