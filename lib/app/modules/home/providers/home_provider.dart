import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';

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
      $_date DATETIME DEFAULT CURRENT_TIMESTAMP,
      $_status BIT DEFAULT 0,
      $_collection_id INTEGER DEFAULT 0
  );''';

  static const String _tbl_collections_data_query = '''
  INSERT INTO $_tbl_collections($_id, $_title, $_description, $_collection_id)VALUES
             (1, 'Collection 1', '1 Collections Description', 0),
             (2, 'Collection 2', '2 Collections Description', 1),
             (3, 'Collection 3', '3 Collections Description', 1),
             (4, 'Collection 4', '4 Collections Description', 1),
             (5, 'Collection 5', '5 Collections Description', 0),
             (6, 'Collection 6', '6 Collections Description', 5),
             (7, 'Collection 7', '7 Collections Description', 5),
             (8, 'Collection 8', '8 Collections Description', 0),
             (9, 'Collection 9', '9 Collections Description', 9);
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
    final List<Map<String, dynamic>> response = await db.query(_tbl_collections);
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

  ///
  // get getCollections => Hive.box<Collection>(AppMessage.collectionsAssets);
  //
  // createCollection(Collection collection) {
  //   final box = getCollections;
  //   return box.add(collection);
  // }
  //
  // updateCollection(Collection collection) {
  //   return collection.save();
  // }
  //
  // deleteCollection(Collection collection) {
  //   return collection.delete();
  // }
}
