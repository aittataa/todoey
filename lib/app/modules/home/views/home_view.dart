import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/config/app_constant.dart';

import '../controllers/home_controller.dart';
import '../pages/details.dart';
import '../pages/home.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView(
        onPageChanged: (index) {
          if (index == 0) {
            FocusScope.of(context).unfocus();
          }
        },
        controller: AppConstant.pageController,
        children: [
          Home(controller: controller),
          Details(controller: controller),
        ],
      ),
    );
  }
}
