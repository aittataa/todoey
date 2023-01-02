// ignore_for_file: constant_identifier_names

import "package:flutter/material.dart";

class AppTheme {
  AppTheme._();

  /// TODO : Others
  static const Color transparent_color = Color(0x00000000);
  static const Color border_color = Color(0xFF252525);
  static const Color shadow_color = Color(0xFF252525);

  /// TODO : Mains
  static const Color main_color_1 = Color(0xFF7349FE);
  static const Color main_color_2 = Color(0xFFFE3577);
  static const Color main_color_3 = Color(0xFF79FCD6);

  /// TODO : Backs
  static const Color back_color_1 = Color(0xFF252525);
  static const Color back_color_2 = Color(0xFFFFFFFF);
  static const Color back_color_3 = Color(0xFFF0F0F0);

  /// TODO : Icons
  static const Color icon_color_1 = Color(0xFF252525);
  static const Color icon_color_2 = Color(0xFFFFFFFF);

  /// TODO : Texts
  static const Color text_color_1 = Color(0xFFFFFFFF);
  static const Color text_color_2 = Color(0xFF211551);
  static const Color text_color_3 = Color(0xFF86829D);

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: back_color_3,
      primaryColor: back_color_3,
      splashColor: back_color_3,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: back_color_3,
        iconTheme: IconThemeData(
          color: icon_color_1.withOpacity(.65),
        ),
        titleTextStyle: const TextStyle(
          color: text_color_2,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
          fontSize: 20,
        ),
      ),
    );
  }
}
