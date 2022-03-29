import 'package:get/get.dart';

import '../models/collection.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  var collections = <Collection>[].obs;
  final state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Collection>> get getCollections async {
    return await _provider.getCollections;
  }

  createCollection(Collection collection) async {
    final response = await _provider.createCollection(collection);
    return response;
  }

  updateCollection(Collection collection) async {
    final response = await _provider.updateCollection(collection);
    return response;
  }

  deleteCollection(int id) async {
    final response = await _provider.deleteCollection(id);
    return response;
  }
}
