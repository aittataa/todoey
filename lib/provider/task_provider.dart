import 'package:flutter/material.dart';
import 'package:todoey/classes/task.dart';
import 'package:todoey/helper/task_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasksList = [];

  get getNoteList async {
    tasksList = await DatabaseHelper.getTasks;
    notifyListeners();
  }

  addNewTask(String value) async {
    Task task = Task(title: value);
    final response = await DatabaseHelper.insertTask(task);
    getNoteList;
    notifyListeners();
    return response;
  }

  updateTask(Task task) async {
    task.updateTaskState();
    final response = await DatabaseHelper.updateTask(task);
    getNoteList;
    notifyListeners();
    return response;
  }

  deleteTask(int id) async {
    final response = await DatabaseHelper.deleteTask(id);
    getNoteList;
    notifyListeners();
    return response;
  }
}
