import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

import "app_constant.dart";
import "app_message.dart";
import "app_theme.dart";

class AppFunction {
  AppFunction._();

  static String dateShape(DateTime date) => DateFormat("MMM dd, yyyy").format(date);
  static String timeShape(DateTime date) => DateFormat("HH:mm").format(date);

  static Future<DateTime> pickDate(BuildContext context) async {
    final DateTime initialDate = DateTime.now();
    final DateTime newDate = await showDatePicker(
          context: context,
          firstDate: DateTime(DateTime.now().year - 100),
          initialDate: initialDate,
          lastDate: DateTime(DateTime.now().year + 100),
          builder: (_, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppTheme.main_color_1,
                  onPrimary: AppTheme.text_color_1,
                  onSurface: AppTheme.text_color_2,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.main_color_1,
                  ),
                ),
              ),
              child: child!,
            );
          },
        ) ??
        initialDate;
    return newDate;
  }

  static snackBar({required String title, required String message}) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: AppTheme.main_color_1,
      margin: const EdgeInsets.all(10),
      titleText: Text(
        title,
        style: const TextStyle(
          color: AppTheme.text_color_3,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: AppTheme.text_color_3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static animateToPage(int index) {
    AppConstant.index = index;
    AppConstant.controller.animateToPage(
      AppConstant.index,
      duration: AppConstant.durationPage,
      curve: AppConstant.curve,
    );
  }

  static get configureDependencies {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.transparent_color,
        systemNavigationBarDividerColor: AppTheme.transparent_color,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppTheme.transparent_color,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
