import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoey/classes/task.dart';
import 'package:todoey/constant/constant.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onChanged;
  final Function onTap;
  TaskTile({this.task, this.onChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        title: Text(
          "${task.title}",
          style: TextStyle(
            color: task.status ? Colors.black38 : Colors.black54,
            fontWeight: FontWeight.w900,
            fontSize: 20,
            decoration: task.status ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          "${dateShape(task.date)}",
          style: TextStyle(
            color: task.status ? Colors.black26 : Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Checkbox(
          activeColor: mainColor,
          value: task.status,
          onChanged: onChanged,
        ),
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: [
        IconSlideAction(
          onTap: onTap,
          color: Colors.transparent,
          foregroundColor: mainColor,
          icon: Icons.delete,
        ),
      ],
    );
  }
}
