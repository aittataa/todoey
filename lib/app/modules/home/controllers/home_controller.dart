import "package:get/get.dart";

import "../models/collection.dart";
import "../providers/home_provider.dart";

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());

  Future<List<Collection>> get getCollections async {
    final List<Collection> response = await _provider.getCollections;
    return response;
  }

  Future<int> createCollection(Collection collection) async {
    final int response = await _provider.createCollection(collection);
    return response;
  }

  Future<int> updateCollection(Collection collection) async {
    final int response = await _provider.updateCollection(collection);
    return response;
  }

  Future<int> deleteCollection(int id) async {
    final int response = await _provider.deleteCollection(id);
    return response;
  }
}
