import 'package:flu_ebook/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  static MaterialTheme _materialTheme = const MaterialTheme(TextTheme());

  ThemeData _themeData = _materialTheme.light();

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == _materialTheme.dark();

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void changeMode() {
    if (_themeData == _materialTheme.light()) {
      themeData = _materialTheme.dark();
    } else {
      themeData = _materialTheme.light();
    }
  }
}
