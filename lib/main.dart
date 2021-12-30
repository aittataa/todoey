import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/app/config/messages/app_message.dart';

import 'app/config/functions/app_function.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  runApp(Todoey());
}

class Todoey extends StatelessWidget {
  const Todoey({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
