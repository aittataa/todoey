import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/config/app_message.dart';
import 'app/config/app_theme.dart';
import 'app/modules/home/pages/splash.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const Todoey());
}

class Todoey extends StatelessWidget {
  const Todoey({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      home: Builder(builder: (_) {
        return const Splash();
      }),
    );
  }
}
