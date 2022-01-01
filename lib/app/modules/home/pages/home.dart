import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
import '../widgets/collection_shape.dart';
import '../widgets/empty_box.dart';

class Home extends StatelessWidget {
  final HomeController controller;
  const Home({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ActionButton(icon: CupertinoIcons.plus_app),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final Collection collection = Collection(
              title: "Collection",
              description: "Some Description",
              date: DateTime.now(),
              status: true,
              myList: [
                Collection(
                  title: "Collection N° 1",
                  description: "Some Description",
                  date: DateTime.now(),
                  status: true,
                ),
                Collection(
                  title: "Collection N° 2",
                  description: "Some Description",
                  date: DateTime.now(),
                  status: false,
                ),
              ],
            );
            var data = await controller.createCollection(collection);
            print(data);
          },
          icon: Icon(CupertinoIcons.house_alt_fill),
        ),
      ),
      body: ValueListenableBuilder<Box<Collection>>(
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
    );
  }
}
