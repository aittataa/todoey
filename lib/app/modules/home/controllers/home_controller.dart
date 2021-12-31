import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
import 'package:to_do_list/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  var collection = Collection().obs;
  @override
  void onInit() {
    super.onInit();
  }
}
