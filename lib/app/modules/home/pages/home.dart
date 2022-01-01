import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/app/config/functions/app_function.dart';
import 'package:to_do_list/app/config/messages/app_message.dart';

import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
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
        icon: CupertinoIcons.plus_app,
        onPressed: () {
          setState(() {
            AppFunction.animateToPage(1);
          });
        },
      ),
      body: SafeArea(
        child: ValueListenableBuilder<Box<Collection>>(
          valueListenable: controller.getCollections.listenable(),
          builder: (context, box, child) {
            final List<Collection> collections = box.values.toList().cast<Collection>()..sort((a, b) => b.id.compareTo(a.id));
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
                  return CollectionShape(collections: collection, state: true);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
