import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/classes/task.dart';
import 'package:todoey/provider/task_provider.dart';
import 'package:todoey/widget/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        taskProvider.getNoteList;
        return ListView.builder(
          padding: EdgeInsets.all(5),
          itemCount: taskProvider.tasksList.length,
          itemBuilder: (context, index) {
            final Task task = taskProvider.tasksList[index];
            return TaskTile(
              task: task,
              onChanged: (value) => taskProvider.updateTask(task),
              onDismissed: (DismissDirection direction) async {
                final data = await taskProvider.deleteTask(task.id);
                print(data);
              },
              //onTap: () => taskProvider.deleteTask(task.id),
            );
          },
        );
      },
    );
  }
}
