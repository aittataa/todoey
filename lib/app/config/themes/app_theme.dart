import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// TODO : Mains
  static const Color mainColor = Color(0xFF7349FE);
  static const Color primaryColor = Color(0xFFFE3577);
  static const Color secondaryColor = Color(0xFF79FCD6);

  /// TODO : Backs
  static const Color backgroundColor = Color(0xFFF6F6F6);
  static const Color primaryBackColor = Color(0xFFFFFFFF);
  static const Color secondaryBackColor = Color(0xFF000000);

  /// TODO : Others
  static const Color transparentColor = Color(0x00000000);
  static const Color borderColor = Color(0xFF000000);
  static const Color shadowColor = Color(0x1F000000);

  /// TODO : Icons
  static const Color primaryIconColor = Color(0xFFFFFFFF);
  static const Color secondaryIconColor = Color(0xFF000000);

  /// TODO : Texts
  static const Color primaryTextColor = Color(0xFF211551);
  static const Color secondaryTextColor = Color(0xFF86829D);

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: backgroundColor,
      splashColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          color: secondaryIconColor.withOpacity(.65),
        ),
        titleTextStyle: TextStyle(
          color: primaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}
