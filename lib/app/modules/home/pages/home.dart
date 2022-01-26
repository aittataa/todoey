import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/functions/app_function.dart';
import 'package:to_do_list/app/config/messages/app_message.dart';

import '../controllers/home_controller.dart';
import '../widgets/action_button.dart';

class Home extends StatefulWidget {
  final HomeController controller;
  const Home({Key? key, required this.controller}) : super(key: key);
  @override
  State<Home> createState() => _HomeState(controller);
}

class _HomeState extends State<Home> {
  final HomeController controller;
  _HomeState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.appTitle)),
      floatingActionButton: ActionButton(
        icon: CupertinoIcons.plus_app,
        onPressed: () {
          setState(() {
            AppFunction.animateToPage(1);
          });
        },
      ),
      /*
      body: SafeArea(
        child: Obx(() {
          final List<Collection> collections = [];
          final bool isEmpty = collections.isEmpty;
          if (isEmpty) {
            return EmptyBox();
          } else {
            return SizedBox();
            /*
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: collections.length,
                itemBuilder: (context, i) {
                  final Collection collection = collections[i];
                  return CollectionShape(collections: collection, state: true);
                },
              );
              */
          }
        }),
      ),
      */
    );
  }
}
