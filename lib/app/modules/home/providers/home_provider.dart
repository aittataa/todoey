import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../config/messages/app_message.dart';
import '../models/collection.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {}

  get getCollections => Hive.box<Collection>(AppMessage.collectionsAssets);

  createCollection(Collection collection) {
    final box = getCollections;
    return box.add(collection);
  }

  updateCollection(Collection collection) {
    return collection.save();
  }

  deleteCollection(Collection collection) {
    return collection.delete();
  }
}
