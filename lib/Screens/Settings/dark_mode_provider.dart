
import 'dart:core';

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
     late ThemeMode themeMode = ThemeMode.dark,

     bool; get isDarkMode => themeMode == ThemeMode.dark;

    void toggleTheme(var isOn) {

      themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
  class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}

