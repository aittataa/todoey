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

  static pickScheduledDate(BuildContext context, {required Function(DateTime) onDateTimeChanged}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.primaryBackColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.all(25),
                color: AppTheme.secondaryIconColor,
                splashColor: AppTheme.transparentColor,
                highlightColor: AppTheme.transparentColor,
                icon: const Icon(CupertinoIcons.clear),
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                onDateTimeChanged: onDateTimeChanged,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                minimumYear: DateTime.now().year,
                maximumYear: DateTime.now().year + 5,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.secondaryColor, backgroundColor: AppTheme.secondaryColor, disabledForegroundColor: AppTheme.secondaryColor.withOpacity(0.38),
                shadowColor: AppTheme.secondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                AppMessage.labelDone,
                style: TextStyle(
                  color: AppTheme.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static snackBar({required String title, required String message}) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: AppTheme.mainColor,
      margin: const EdgeInsets.all(10),
      titleText: Text(
        title,
        style: const TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
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
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.transparentColor,
        systemNavigationBarDividerColor: AppTheme.transparentColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppTheme.transparentColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
