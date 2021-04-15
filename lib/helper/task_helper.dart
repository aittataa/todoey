import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoey/classes/task.dart';

class DatabaseHelper {
  static Database _myDataBase;
  static const String _db_name = "todoey.db";
  static const String _tbl_tasks = "tasks";
  static const String _id_task = "id";
  static const String _title_task = "title";
  static const String _date_task = "date";
  static const String _status_task = "status";

  static Future<Database> get _database async {
    if (_myDataBase != null) {
      return _myDataBase;
    }
    _myDataBase = await openDatabase(
      join(await getDatabasesPath(), '$_db_name'),
      version: 1,
      onCreate: (db, version) async {
        db.execute(
          '''CREATE TABLE $_tbl_tasks(
            $_id_task INTEGER PRIMARY KEY AUTOINCREMENT,
            $_title_task TEXT NOT NULL,
            $_date_task DATETIME DEFAULT CURRENT_TIMESTAMP,
            $_status_task bit NOT NULL
           );''',
        );
      },
    );
    return _myDataBase;
  }

  static get getAllTasks async {
    final db = await _database;
    final List<Map<String, dynamic>> tasksList = await db.query(
      "$_tbl_tasks",
      orderBy: "$_id_task DESC",
    );
    return List.generate(tasksList.length, (i) {
      return Task(
        id: tasksList[i]['$_id_task'],
        title: tasksList[i]['$_title_task'],
        date: DateTime.parse(tasksList[i]['$_date_task']),
        status: tasksList[i]['$_status_task'] == 1 ? true : false,
      );
    });
  }

  static insertTask(Task task) async {
    final db = await _database;
    return db.rawInsert(
      "INSERT INTO $_tbl_tasks($_title_task, $_status_task)VALUES(?, ?)",
      [task.title, task.status],
    );
  }

  static updateTask(Task task) async {
    final db = await _database;
    return db.rawInsert(
      "UPDATE $_tbl_tasks SET $_status_task = ? WHERE $_id_task = ?",
      [task.status, task.id],
    );
  }

  static deleteTask(int id) async {
    final db = await _database;
    return db.rawInsert("DELETE FROM $_tbl_tasks WHERE $_id_task = $id");
  }
}
