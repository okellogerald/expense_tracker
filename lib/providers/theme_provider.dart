import '../source.dart';

class ThemeProvider extends ChangeNotifier {
  String _theme = 'Dark';

  void changeTheme() {
    if (_theme == 'Dark') {
      _theme = 'Light';
    } else {
      _theme == 'Dark';
    }
    log('done');
    notifyListeners();
  }

  String get getCurrentTheme => _theme;
}
