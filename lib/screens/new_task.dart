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
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          insetPadding: EdgeInsets.zero,
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 150,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: mainColor, width: 2)),
                  ),
                  child: Text(
                    "New Task",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: mainColor, fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextField(
                    controller: controller,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    scrollPadding: EdgeInsets.zero,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: "Type...",
                      hintStyle: TextStyle(
                        color: Colors.black26,
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
                ),
                MaterialButton(
                  onPressed: () {
                    if (controller.text.trim() != "") {
                      String taskValue = controller.text.trim();
                      taskProvider.addNewTask(taskValue);
                      Navigator.pop(context);
                    }
                  },
                  color: mainColor,
                  minWidth: double.infinity,
                  height: 45,
                  elevation: 3,
                  highlightElevation: 3,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
