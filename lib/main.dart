import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/views/home_view.dart';

import 'app/config/app_function.dart';
import 'app/config/app_message.dart';
import 'app/config/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      home: HomeView(),
    );
  }
}
