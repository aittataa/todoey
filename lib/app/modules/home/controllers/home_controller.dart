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
    _getCollections;
  }

  get _getCollections async {
    state.value = true;
    collections.value = await _provider.getCollections;
    state.value = false;
  }

  createCollection(Collection collection) async {
    final response = await _provider.createCollection(collection);
    //_getCollections;
    return response;
  }

  updateCollection(Collection collection) async {
    final response = await _provider.updateCollection(collection);
    //_getCollections;
    return response;
  }

  deleteCollection(int id) async {
    final response = await _provider.deleteCollection(id);
    //_getCollections;
    return response;
  }
}
