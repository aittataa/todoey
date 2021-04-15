import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constant/constant.dart';
import 'package:todoey/provider/task_provider.dart';
import 'package:todoey/screens/new_task.dart';
import 'package:todoey/widget/tasks_list.dart';

class TasksManager extends StatefulWidget {
  @override
  _TasksManagerState createState() => _TasksManagerState();
}

class _TasksManagerState extends State<TasksManager> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        taskProvider.getNoteList;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showCupertinoModalPopup(
                barrierColor: Colors.black54,
                context: context,
                builder: (context) {
                  return NewTask();
                },
              );
            },
            backgroundColor: mainColor,
            foregroundColor: Colors.white,
            child: Icon(
              CupertinoIcons.add,
              size: 32,
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 32,
                        child: Icon(
                          Icons.menu_open,
                          size: 40,
                          color: mainColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "$appTitle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 56,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Text(
                        "${taskProvider.tasksList.length} Tasks",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TasksList(),
                    decoration: BoxDecoration(
                      color: backColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
