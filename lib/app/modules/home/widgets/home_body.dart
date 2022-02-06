import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:to_do_list/app/config/app_function.dart';
import 'package:to_do_list/app/config/app_theme.dart';

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
  final bool state = true;
  @override
  Widget build(BuildContext context) {
    if (state) {
      return GroupedListView<dynamic, DateTime>(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        elements: myList,
        order: GroupedListOrder.DESC,
        groupBy: (collection) {
          return collection.date;
        },
        groupSeparatorBuilder: (DateTime date) {
          return DateShape(date: date);
        },
        itemBuilder: (context, collection) {
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
}

class DateShape extends StatelessWidget {
  final DateTime date;
  const DateShape({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.mainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "${AppFunction.dateShape(date)}",
          style: TextStyle(
            color: AppTheme.textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
