import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/classes/task.dart';
import 'package:todoey/constant/constant.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onChanged;
  final Function onTap;
  final Function onDismissed;
  TaskTile({this.task, this.onChanged, this.onTap, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      key: Key("delete"),
      child: ListTile(
        title: Text(
          "${task.title}",
          style: TextStyle(
            color: task.status ? Colors.black38 : Colors.black54,
            decoration: task.status ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
        subtitle: Text(
          "${dateShape(task.date)}",
          style: TextStyle(
            color: task.status ? Colors.black26 : Colors.black45,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        trailing: Checkbox(
          onChanged: onChanged,
          activeColor: mainColor,
          value: task.status,
        ),
      ),
      //actionPane: SlidableDrawerActionPane(),
      // actionExtentRatio: 0.15,
      // secondaryActions: [
      //   IconSlideAction(
      //     onTap: onTap,
      //     color: Colors.transparent,
      //     foregroundColor: mainColor,
      //     icon: Icons.delete,
      //   ),
      // ],
    );
  }
}
