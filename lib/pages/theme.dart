// Colors
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class PriceChangeColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0XFFFFFFFF);
  static final pink = Color(0XFFF5638B);
}

final PriceChangeGradients = [
  PriceChangeColors.green,
  PriceChangeColors.purple,
];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: PriceChangeColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: PriceChangeColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: PriceChangeColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
        fontSize: 20,
        color: PriceChangeColors.purple,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  canvasColor: PriceChangeColors.white,
  accentColor: PriceChangeColors.purple,
  bottomAppBarColor: PriceChangeColors.veryLightGrey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: PriceChangeColors.purple,
    displayColor: PriceChangeColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderLight,
    enabledBorder: _borderLight,
    labelStyle: TextStyle(color: PriceChangeColors.purple),
    focusedBorder: _borderLight,
    contentPadding: EdgeInsets.zero,
    hintStyle: GoogleFonts.poppins(
      color: PriceChangeColors.lightGrey,
      fontSize: 10,
    ),
  ),
  iconTheme: IconThemeData(
    color: PriceChangeColors.purple,
  ),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: PriceChangeColors.purple,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
        fontSize: 20,
        color: PriceChangeColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  bottomAppBarColor: Colors.transparent,
  canvasColor: PriceChangeColors.grey,
  scaffoldBackgroundColor: PriceChangeColors.dark,
  accentColor: PriceChangeColors.white,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: PriceChangeColors.green,
    displayColor: PriceChangeColors.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderDark,
    enabledBorder: _borderDark,
    contentPadding: EdgeInsets.zero,
    focusedBorder: _borderDark,
    labelStyle: TextStyle(color: PriceChangeColors.white),
    fillColor: PriceChangeColors.grey,
    filled: true,
    hintStyle: GoogleFonts.poppins(
      color: PriceChangeColors.white,
      fontSize: 10,
    ),
  ),
  iconTheme: IconThemeData(
    color: PriceChangeColors.white,
  ),
);
