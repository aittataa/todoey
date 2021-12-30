import 'package:flutter/material.dart';
import 'package:todoey/classes/task.dart';
import 'package:todoey/helper/task_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasksList = [];

  void get getNoteList async {
    tasksList = await DatabaseHelper.getTasks;
    notifyListeners();
  }

  void addNewTask(String taskValue) {
    Task task = Task(title: taskValue);
    DatabaseHelper.insertTask(task);
    getNoteList;
    notifyListeners();
  }

  void updateTask(Task task) {
    task.updateTaskState();
    DatabaseHelper.updateTask(task);
    getNoteList;
    notifyListeners();
  }

  void deleteTask(int id) {
    DatabaseHelper.deleteTask(id);
    getNoteList;
    notifyListeners();
  }
}
