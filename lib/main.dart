// ignore_for_file: camel_case_types

import "package:flutter/material.dart";
import 'app/config/app_function.dart';
import "app/config/app_message.dart";
import "app/config/app_theme.dart";
import "app/modules/home/pages/splash_page.dart";
import "package:get/get.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  runApp(const iCheck());
}

class iCheck extends StatelessWidget {
  const iCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      home: const SplashPage(),
    );
  }
}
