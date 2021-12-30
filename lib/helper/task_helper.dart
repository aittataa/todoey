import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoey/classes/task.dart';

class DatabaseHelper {
  static const String _db_name = "todoey.db";
  static const String _tbl_tasks = "tasks";
  static const String _id_task = "id";
  static const String _title_task = "title";
  static const String _date_task = "date";
  static const String _status_task = "status";
  static const String _task_query = '''
  CREATE TABLE $_tbl_tasks(
        $_id_task INTEGER PRIMARY KEY AUTOINCREMENT,
        $_title_task TEXT NOT NULL,
        $_date_task DATETIME DEFAULT CURRENT_TIMESTAMP,
        $_status_task bit NOT NULL
  );''';

  static Future<Database> get _database async {
    return await openDatabase(
      join(await getDatabasesPath(), _db_name),
      version: 1,
      onCreate: (db, version) async {
        db.execute(_task_query);
      },
    );
  }

  static get getTasks async {
    final db = await _database;
    final List<Map<String, dynamic>> response = await db.query(
      _tbl_tasks,
      orderBy: "$_id_task DESC",
    );
    return taskFromMap(response);
  }

  static insertTask(Task task) async {
    final db = await _database;
    final response = await db.insert(
      _tbl_tasks,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  static updateTask(Task task) async {
    final db = await _database;
    final response = await db.update(
      _tbl_tasks,
      task.toMap(),
      where: "$_id_task = ?",
      whereArgs: [task.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  static deleteTask(int id) async {
    final db = await _database;
    final response = await db.delete(
      _tbl_tasks,
      where: "$_id_task = ?",
      whereArgs: [id],
    );
    return response;
  }
}
