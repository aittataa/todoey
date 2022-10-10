import "package:get/get.dart";

import "../modules/home/bindings/home_binding.dart";
import "../modules/home/views/home_view.dart";

part "app_routes.dart";

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.HOME;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
