import 'package:flutter/material.dart';

class LanguageData with ChangeNotifier {

  Locale _currentLocale = new Locale("en");

  Locale get currentLocale => _currentLocale;

  void ChangeLocal(String _locale) {
    this._currentLocale = new Locale(_locale);
    notifyListeners();
  }
}