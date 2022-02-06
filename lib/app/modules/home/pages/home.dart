import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:to_do_list/app/modules/home/widgets/collection_shape.dart';
import 'package:to_do_list/app/modules/home/widgets/date_item.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
import '../widgets/bounce_point.dart';
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
      body: Builder(builder: (context) {
        final bool state = controller.state.value;
        if (state) {
          return BouncePoint();
        } else {
          final List<Collection> collections = controller.collections;
          final bool isEmpty = collections.isEmpty;
          if (isEmpty) {
            return EmptyBox();
          } else {
            return GroupedListView<dynamic, DateTime>(
              shrinkWrap: true,
              elements: collections,
              order: GroupedListOrder.DESC,
              groupBy: (collection) {
                return DateTime.utc(
                  collection.date.year,
                  collection.date.month,
                  collection.date.day,
                );
              },
              groupSeparatorBuilder: (DateTime date) {
                return DateItem(date: date);
              },
              itemBuilder: (context, collection) {
                return CollectionShape(
                  controller: controller,
                  collection: collection,
                  onPressed: () async {
                    final int id = collection.id!;
                    final data = await controller.deleteCollection(id);
                    setState(() {
                      print(collections.remove(collection));
                      print(data);
                    });
                  },
                );
              },
            );
          }
        }
      }),
    );
  }
}
