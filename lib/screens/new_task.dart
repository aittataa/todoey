import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constant/constant.dart';
import 'package:todoey/provider/task_provider.dart';

class NewTask extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        taskProvider.getNoteList;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "New Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              TextField(
                controller: controller,
                maxLength: 40,
                style: TextStyle(
                  color: darkTextColor,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Type...",
                  hintStyle: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (controller.text.trim() != "") {
                    String taskValue = controller.text.trim();
                    taskProvider.addNewTask(taskValue);
                    Navigator.pop(context);
                  }
                },
                height: 50,
                color: mainColor,
                elevation: 3,
                highlightElevation: 3,
                highlightColor: transparentColor,
                splashColor: transparentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
