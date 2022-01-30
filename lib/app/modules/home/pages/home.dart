import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/config/app_function.dart';
import 'package:to_do_list/app/config/app_message.dart';
import 'package:to_do_list/app/config/app_theme.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
import 'package:to_do_list/app/modules/home/widgets/bounce_point.dart';
import 'package:to_do_list/app/modules/home/widgets/collection_shape.dart';
import 'package:to_do_list/app/modules/home/widgets/empty_box.dart';

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
        backgroundColor: AppTheme.mainColor,
        foregroundColor: AppTheme.primaryIconColor,
        circular: 20,
        onPressed: () {
          setState(() {
            AppFunction.animateToPage(1);
          });
        },
      ),
      body: SafeArea(
        child: Obx(() {
          final bool state = controller.state.value;
          if (state) {
            return BouncePoint();
          } else {
            final List<Collection> collections = controller.collections;
            final bool isEmpty = collections.isEmpty;
            if (isEmpty) {
              return EmptyBox();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: collections.length,
                itemBuilder: (context, i) {
                  final Collection collection = collections[i];
                  return CollectionShape(
                    controller: controller,
                    collection: collection,
                    onDelete: () async {
                      final data = await controller.deleteCollection(collection);
                      setState(() {
                        collections.remove(collection);
                        print(data);
                      });
                    },
                  );
                },
              );
            }
          }
        }),
      ),
    );
  }
}
