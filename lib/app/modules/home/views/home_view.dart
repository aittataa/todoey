import "package:flutter/material.dart";

import "../../../config/app_constant.dart";
import "../pages/details_page.dart";
import "../pages/home_page.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView(
        controller: AppConstant.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          HomePage(),
          DetailsPage(),
        ],
      ),
    );
  }
}
