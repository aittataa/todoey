import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../providers/home_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
