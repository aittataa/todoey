import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'app_constant.dart';
import 'app_theme.dart';

class AppFunction {
  AppFunction._();

  static int get getRandomColor => Color(Random().nextInt(0xFFFFFFFF)).withAlpha(0xFF).value;

  static String dateShape(DateTime date) => DateFormat('MMM dd, yyyy').format(date);
  static String timeShape(DateTime date) => DateFormat('HH:mm').format(date);

  static pickScheduledDate(context, {required Function(DateTime) onDateTimeChanged}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.primaryBackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return CupertinoDatePicker(
          onDateTimeChanged: onDateTimeChanged,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          minimumYear: DateTime.now().year,
          maximumYear: DateTime.now().year + 5,
        );
      },
    );
  }

  static snackBar({required String title, required String message}) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: AppTheme.mainColor,
      margin: EdgeInsets.all(10),
      titleText: Text(
        title,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static animateToPage(int index) {
    AppConstant.pageIndex = index;
    AppConstant.pageController.animateToPage(
      AppConstant.pageIndex,
      duration: AppConstant.durationPage,
      curve: AppConstant.curve,
    );
  }

  static get configureDependencies {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.primaryBackColor,
        systemNavigationBarDividerColor: AppTheme.primaryBackColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppTheme.transparentColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
