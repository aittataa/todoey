import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const String appTitle = "Todoey";
const String appDesc = "To-Do List";

dateShape(DateTime date) => DateFormat('MMM/dd/yyyy, HH:mm').format(date);

get configureDependencies {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: transparentColor,
      systemNavigationBarDividerColor: transparentColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: transparentColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
}

Color mainColor = Colors.lightBlueAccent;
Color backColor = Color(0xFFF0F0F0);
Color backgroundColor = Color(0xFFFFFFFF);

Color transparentColor = Color(0x00000000);

Duration duration = Duration(milliseconds: 1500);
