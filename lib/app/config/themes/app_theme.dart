import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  /// TODO : Mains
  static const Color mainColor = Color(0xFF7349FE);
  static const Color primaryColor = Color(0xFFFE3577);
  static const Color secondaryColor = Color(0xFF79FCD6);

  /// TODO : Backs
  static const Color backgroundColor = Color(0xFFF6F6F6);
  static const Color backgroundImageColor = Color(0xFFFFFFFF);
  static const Color primaryBackColor = Color(0xFFFFFFFF);
  static const Color secondaryBackColor = Color(0xFF000000);

  /// TODO : Others
  static const Color transparentColor = Color(0x00000000);
  static const Color shadowColor = Color(0x1F000000);

  /// TODO : Icons
  static const Color primaryIconColor = Color(0xFF000000);
  static const Color secondaryIconColor = Color(0xFFFFFFFF);

  /// TODO : Texts
  static const Color primaryTextColor = Color(0xFF211551);
  static const Color secondaryTextColor = Color(0xFF86829D);

  static ThemeData themeData(context) {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: backgroundColor,
      splashColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: mainColor,
        titleTextStyle: TextStyle(
          color: secondaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
    );
  }
}
