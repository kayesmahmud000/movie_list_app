import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider  extends ChangeNotifier{
  bool _isDarkMode =false;

  bool getThemeMode()=> _isDarkMode;

  ThemeProvider(){
    loadTheme();
  }
  
  void updateTheme({required bool mode}) async{
    _isDarkMode =mode;

    SharedPreferences preferences =await SharedPreferences.getInstance();

    preferences.setBool("themeMode", mode);

    notifyListeners();
    

  }
  
  void loadTheme()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

  _isDarkMode = preferences.getBool('themeMode') ?? false;

    notifyListeners();
  }
}