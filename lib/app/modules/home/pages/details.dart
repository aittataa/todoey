import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class Details extends StatelessWidget {
  final HomeController controller;
  const Details({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            controller.getCollections;
          },
          icon: Icon(CupertinoIcons.bag_fill),
        ),
      ),
      body: Center(child: Text("Details Page")),
    );
  }
}
