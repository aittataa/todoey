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

  // static const String _tbl_collections_data_query = '''
  // INSERT INTO $_tbl_collections($_title, $_description, $_date)VALUES
  //      ('Take The Kids', '', '2022-02-06 13:00:00'),
  //      ('Go To The Store', 'Get The Grocery and The House Stuff', '2022-02-07 14:11:00'),
  //      ('Collection 3', 'Description 3', '2022-02-07 15:13:00'),
  //      ('Collection 4', 'Description 4', '2022-02-08 15:45:00'),
  //      ('Collection 5', 'Description 5', '2022-02-08 16:28:00'),
  //      ('Collection 6', 'Description 6', '2022-02-09 13:09:00'),
  //      ('Collection 7', 'Description 7', '2022-02-05 17:36:00'),
  //      ('Collection 8', 'Description 8', '2022-02-01 18:40:00'),
  //      ('Collection 9', 'Description 9', '2022-02-02 19:55:00');
  // ''';

  Future<Database> get _database async {
    return await openDatabase(
      join(await getDatabasesPath(), _db_name),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_tbl_collections_query);
        // await db.execute(_tbl_collections_data_query);
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

  Future createCollection(Collection collection) async {
    final db = await _database;
    final response = await db.insert(
      _tbl_collections,
      collection.toMap(),
    );
    return response;
  }

  Future updateCollection(Collection collection) async {
    final db = await _database;
    final response = await db.update(
      _tbl_collections,
      collection.toMap(),
      where: "$_id = ?",
      whereArgs: [collection.id],
    );
    return response;
  }

  Future deleteCollection(int id) async {
    final db = await _database;
    final response = await db.delete(
      _tbl_collections,
      where: "$_id = ?",
      whereArgs: [id],
    );
    return response;
  }
}
