import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
import '../widgets/bounce_point.dart';
import '../widgets/collection_shape.dart';
import '../widgets/date_item.dart';
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
        backgroundColor: AppTheme.mainColor,
        foregroundColor: AppTheme.primaryIconColor,
        onPressed: () {
          setState(() => {AppFunction.animateToPage(1)});
        },
      ),
      body: Builder(builder: (context) {
        final bool state = controller.state.value;
        if (state) {
          return BouncePoint(state: false);
        } else {
          final List<Collection> collections = controller.collections;
          final bool isEmpty = collections.isEmpty;
          if (isEmpty) {
            return EmptyBox();
          } else {
            return GroupedListView<dynamic, DateTime>(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const BouncingScrollPhysics(),
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
                if (date == DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1)) {
                  return DateItem(label: AppMessage.labelYesterday, date: date);
                } else if (date == DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day)) {
                  return DateItem(label: AppMessage.labelToday, date: date);
                } else if (date == DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)) {
                  return DateItem(label: AppMessage.labelTomorrow, date: date);
                } else {
                  return DateItem(label: AppFunction.dateShape(date), date: date);
                }
              },
              itemBuilder: (context, collection) {
                return CollectionShape(
                  controller: controller,
                  collection: collection,
                  onUpdate: () async {
                    setState(() => {collection.updateStatus});
                    final data = await controller.updateCollection(collection);
                    print(data);
                  },
                  onDelete: () async {
                    final int id = collection.id!;
                    setState(() => {collections.remove(collection)});
                    final data = await controller.deleteCollection(id);
                    setState(() => {print(data)});
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
