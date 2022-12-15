import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: Colors.deepPurple,
      brightness: Brightness.light,
      canvasColor: creamColor,
      cardColor: Colors.white,
      colorScheme: ColorScheme.light(
          secondary: darkBlueishColor, onSecondary: darkBlueishColor),
      fontFamily: GoogleFonts.poppins().fontFamily,
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          // titleTextStyle: const TextStyle(color: Colors.black),
          backgroundColor: MyThemes.creamColor,
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black)));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primaryColor: Colors.deepPurple,
      brightness: Brightness.dark,
      canvasColor: darkCreamColor,
      // canvasColor: darkBlueishColor,
      cardColor: Colors.black,
      colorScheme: ColorScheme.dark(
          secondary: lightBlueishColor, onSecondary: Colors.white),
      fontFamily: GoogleFonts.poppins().fontFamily,
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          backgroundColor: MyThemes.darkCreamColor,
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white)));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray800;
  static Color darkBlueishColor = const Color(0Xff403b58);
  static Color lightBlueishColor = Vx.indigo400;
}
