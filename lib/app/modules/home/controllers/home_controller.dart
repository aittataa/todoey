import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
import 'package:to_do_list/app/modules/home/providers/home_provider.dart';

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
  //
  // createCollection(Collection collection) {
  //   return _provider.createCollection(collection);
  // }
  //
  // updateCollection(Collection collection) {
  //   return _provider.updateCollection(collection);
  // }
  //
  // deleteCollection(Collection collection) {
  //   return _provider.deleteCollection(collection);
  // }
}
