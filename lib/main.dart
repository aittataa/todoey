import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/config/functions/app_function.dart';
import 'app/config/messages/app_message.dart';
import 'app/config/themes/app_theme.dart';
import 'app/modules/home/models/collection.dart';
import 'app/modules/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  await Hive.initFlutter();
  Hive.registerAdapter(CollectionAdapter());
  await Hive.openBox<Collection>(AppMessage.collectionsAssets);
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
