import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
import '../widgets/bounce_point.dart';
import '../widgets/collection_shape.dart';
import '../widgets/empty_box.dart';

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
        circular: 20,
        backgroundColor: AppTheme.mainColor,
        foregroundColor: AppTheme.primaryIconColor,
        onPressed: () {
          setState(() => {AppFunction.animateToPage(1)});
        },
      ),
      body: SafeArea(
        child: Obx(() {
          final bool state = controller.state.value;
          if (state) {
            return BouncePoint();
          } else {
            final List<Collection> collections = controller.collections;
            final List<Collection> myList = collections..sort((a, b) => b.id!.compareTo(a.id!));
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
                    controller: controller,
                    collection: collection,
                    onPressed: () async {
                      final int id = collection.id!;
                      final data = await controller.deleteCollection(id);
                      setState(() {
                        print(myList.remove(collection));
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
