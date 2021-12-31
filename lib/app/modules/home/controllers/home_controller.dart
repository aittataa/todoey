import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
import 'package:to_do_list/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  var collection = Collection().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Box<Collection> get getCollections => _provider.getCollections;

  createCollection(Collection collection) async {
    return _provider.createCollection(collection);
  }

  updateCollection(Collection collection) {
    return _provider.updateCollection(collection);
  }

  deleteCollection(Collection collection) {
    return _provider.deleteCollection(collection);
  }
}
