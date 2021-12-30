import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constant/constant.dart';
import 'package:todoey/provider/task_provider.dart';
import 'package:todoey/screens/tasks_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies;
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      builder: (context, child) {
        //TaskProvider taskProvider = TaskProvider();
        //taskProvider.getNoteList;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appTitle,
          color: mainColor,
          theme: ThemeData.light().copyWith(
            primaryColor: mainColor,
            scaffoldBackgroundColor: mainColor,
          ),
          home: AnimatedSplashScreen(
            nextScreen: TasksManager(),
            splash: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "images/app_icon.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                SpinKitThreeBounce(
                  size: 75,
                  color: mainColor,
                  duration: duration,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    appDesc,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            curve: Curves.linearToEaseOut,
            backgroundColor: backgroundColor,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: duration,
            splashIconSize: double.infinity,
          ),
        );
      },
    );
  }
}
