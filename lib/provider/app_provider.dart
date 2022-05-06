import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String appLanguage ='en';
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String languageCode){
    appLanguage = languageCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode){
    this.themeMode==themeMode;
    notifyListeners();
  }
}