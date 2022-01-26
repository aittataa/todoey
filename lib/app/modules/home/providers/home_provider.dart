import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {}
  static const String _db_name = "to_do_list.db";
  static const String _id = "id";
  static const String _title = "title";
  static const String _state = "state";

  static const String _tbl_settings = "settings";
  static const String _currency = "currency";
  static const String _tbl_settings_query = '''
  CREATE TABLE $_tbl_settings(
      $_id INTEGER PRIMARY KEY AUTOINCREMENT, 
      $_currency TEXT NOT NULL
  );''';
  static const String _tbl_settings_data_query = '''
  INSERT INTO $_tbl_settings ($_id, $_currency) VALUES (1, 'DH')''';

  static const String _tbl_category = "categories";
  static const String _color = "color";
  static const String _total = "total";
  static const String _tbl_category_query = '''
  CREATE TABLE $_tbl_category(
      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_title TEXT NOT NULL,
      $_color INTEGER NOT NULL,
      $_state BIT NOT NULL
  );''';

  // static String _tbl_category_data_query = '''
  // INSERT INTO $_tbl_category($_id, $_title, $_color, $_state)VALUES
  //   (1, 'Others', '${AppFunction.getRandomColor}', 0),
  //   (2, 'Salary', '${AppFunction.getRandomColor}', 0),
  //   (3, 'Others', '${AppFunction.getRandomColor}', 1),
  //   (4, 'Food', '${AppFunction.getRandomColor}', 1),
  //   (5, 'Clothes', '${AppFunction.getRandomColor}', 1),
  //   (6, 'Transportation', '${AppFunction.getRandomColor}', 1),
  //   (7, 'Shopping', '${AppFunction.getRandomColor}', 1),
  //   (8, 'Bills', '${AppFunction.getRandomColor}', 1)
  // ''';

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
