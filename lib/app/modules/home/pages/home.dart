import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/config/functions/app_function.dart';
import 'package:to_do_list/app/config/messages/app_message.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';
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
            final List<Collection> myList = collections.where((collection) => collection.collectionId == 0).toList()..sort((a, b) => b.id!.compareTo(a.id!));
            final bool isEmpty = myList.isEmpty;
            if (isEmpty) {
              return EmptyBox();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: myList.length,
                itemBuilder: (context, i) {
                  final Collection collection = myList[i];
                  return CollectionShape(
                    collection: collection,
                    myList: collections.where((_collection) => _collection.collectionId == collection.id).toList()..sort((a, b) => b.id!.compareTo(a.id!)),
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
