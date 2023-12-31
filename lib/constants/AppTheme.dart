import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Color> colorList = [
  Color.fromRGBO(31, 31, 31, 1),
  Color.fromRGBO(116, 116, 116, 1),
  Color.fromRGBO(124, 124, 124, 1),
  Color.fromRGBO(132, 132, 132, 1),
  Color.fromRGBO(251, 251, 251, 1),
];

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.rajdhani().fontFamily,
  colorScheme: ColorScheme.light(background: Colors.blueGrey.shade200),
  primaryColor: const Color.fromRGBO(31, 31, 31, 1),
  primaryColorDark: Color.fromRGBO(145, 145, 145, 1),
  primaryColorLight: Color.fromRGBO(190, 190, 190, 1),
);

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.rajdhani().fontFamily,
  colorScheme: ColorScheme.dark(background: Colors.grey.shade700),
  primaryColor: Color.fromRGBO(251, 251, 251, 1),
  primaryColorDark: Color.fromRGBO(80, 80, 80, 1),
  primaryColorLight: Color.fromRGBO(190, 190, 190, 1),
);

class AppTheme with ChangeNotifier {
  bool isLightTheme = false;
  ThemeData theme = darkTheme;

  ThemeMode get themeMode => isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    isLightTheme = !isLightTheme;
    theme = isLightTheme ? lightTheme : darkTheme;
    notifyListeners();
  }
}

AppTheme appTheme = AppTheme();
