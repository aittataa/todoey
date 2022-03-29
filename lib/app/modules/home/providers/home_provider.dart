// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/collection.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {}
  static const String _db_name = "collections.db";
  static const String _tbl_collections = "collections";
  static const String _id = "id";
  static const String _title = "title";
  static const String _description = "description";
  static const String _date = "date";
  static const String _status = "status";
  static const String _collection_id = "collection_id";

  static const String _tbl_collections_query = '''
  CREATE TABLE $_tbl_collections(
      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_title TEXT NOT NULL,
      $_description TEXT,
      $_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      $_status INTEGER DEFAULT 0,
      $_collection_id INTEGER DEFAULT 0
  );''';

  static String _tbl_collections_data_query = '''
  INSERT INTO $_tbl_collections($_title, $_description, $_date)VALUES
       ('Collection 1', 'Description 1', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3)}'),
       ('Collection 2', 'Description 2', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2)}'),
       ('Collection 3', 'Description 3', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1)}'),
       ('Collection 4', 'Description 4', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day)}'),
       ('Collection 5', 'Description 5', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)}'),
       ('Collection 6', 'Description 6', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2)}'),
       ('Collection 7', 'Description 7', '${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3)}');
  ''';

  Future<Database> get _database async {
    return await openDatabase(
      join(await getDatabasesPath(), _db_name),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_tbl_collections_query);
        //await db.execute(_tbl_collections_data_query);
      },
    );
  }

  Future<List<Collection>> get getCollections async {
    final db = await _database;
    final List<Map<String, dynamic>> response = await db.query(
      _tbl_collections,
      orderBy: "$_id DESC",
    );
    return collectionsFromMap(response);
  }

  Future<int> createCollection(Collection collection) async {
    final db = await _database;
    final int response = await db.insert(
      _tbl_collections,
      collection.toMap(),
    );
    return response;
  }

  Future<int> updateCollection(Collection collection) async {
    final db = await _database;
    final int response = await db.update(
      _tbl_collections,
      collection.toMap(),
      where: "$_id = ?",
      whereArgs: [collection.id],
    );
    return response;
  }

  Future<int> deleteCollection(int id) async {
    final db = await _database;
    final int response = await db.delete(
      _tbl_collections,
      where: "$_id = ?",
      whereArgs: [id],
    );
    return response;
  }
}
