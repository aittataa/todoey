import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../models/collection.dart';
import 'collection_shape.dart';

class Body extends StatefulWidget {
  final HomeController controller;
  final List<Collection> myList;
  const Body({Key? key, required this.controller, required this.myList}) : super(key: key);
  @override
  State<Body> createState() => _BodyState(controller, myList);
}

class _BodyState extends State<Body> {
  final HomeController controller;
  final List<Collection> myList;
  _BodyState(this.controller, this.myList);
  @override
  Widget build(BuildContext context) {
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
