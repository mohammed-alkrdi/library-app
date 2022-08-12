import 'package:flutter/material.dart';
import 'package:my_library/Widgets/theme_pre_helper.dart';

class ThemeProvider extends ChangeNotifier {
  final darkTheme = ThemeData(
    //primarySwatch: Colors.deepPurple,
    primaryColor: Colors.white,
    //brightness: Brightness.dark,
    primaryColorDark: Colors.purple.shade200,
    backgroundColor: Colors.grey.shade900,
    iconTheme: IconThemeData(color: Colors.purple.shade200 , opacity: 0.8),
    dividerColor: Colors.black12,

  );

  final lightTheme = ThemeData(
   // primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    primaryColorLight: Colors.red.shade300,
    //brightness: Brightness.light,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.red.shade300, opacity: 0.8),
    dividerColor: Colors.white,
  );
  bool _isDark = false;
  ThemePreferences _preferences = ThemePreferences();
  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }
  getPreferences() async {
     _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }
}