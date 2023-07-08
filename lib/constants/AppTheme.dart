import 'package:flutter/material.dart';

List<Color> colorList = [
  Color.fromRGBO(31, 31, 31, 1),
  Color.fromRGBO(116, 116, 116, 1),
  Color.fromRGBO(124, 124, 124, 1),
  Color.fromRGBO(132, 132, 132, 1),
  Color.fromRGBO(251, 251, 251, 1),
];

ThemeData lightTheme = ThemeData(
  primaryColor: Color.fromRGBO(31, 31, 31, 1),
  primaryColorDark: Color.fromRGBO(80, 80, 80, 1),
  primaryColorLight: Color.fromRGBO(190, 190, 190, 1),
  backgroundColor: Color.fromRGBO(251, 251, 251, 1),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Color.fromRGBO(251, 251, 251, 1),
  primaryColorDark: Color.fromRGBO(80, 80, 80, 1),
  primaryColorLight: Color.fromRGBO(190, 190, 190, 1),
  backgroundColor: Color.fromRGBO(31, 31, 31, 1),
);

class AppTheme with ChangeNotifier {
  bool isDarkTheme = false;

  ThemeMode get themeMode => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}

AppTheme appTheme = AppTheme();
