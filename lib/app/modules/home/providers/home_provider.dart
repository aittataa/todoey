import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/app/config/messages/app_message.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {}

  get getCollections {
    var data = Hive.box<Collection>(AppMessage.collectionsAssets);
    return data;
  }

  createCollection(Collection collection) async {
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
