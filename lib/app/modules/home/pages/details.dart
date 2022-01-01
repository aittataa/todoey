import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/messages/app_message.dart';

import '../../../config/functions/app_function.dart';
import '../controllers/home_controller.dart';

class Details extends StatefulWidget {
  final HomeController controller;
  const Details({Key? key, required this.controller}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState(controller);
}

class _DetailsState extends State<Details> {
  final HomeController controller;
  _DetailsState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              AppFunction.animateToPage(0);
            });
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text(AppMessage.newTask),
      ),
      body: Center(child: Text("Details Page")),
    );
  }
}
