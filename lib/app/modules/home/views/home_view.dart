import "package:flutter/material.dart";

import "../../../config/app_constant.dart";
import "../pages/details.dart";
import "../pages/home.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView(
        controller: AppConstant.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Home(),
          Details(),
        ],
      ),
    );
  }
}
