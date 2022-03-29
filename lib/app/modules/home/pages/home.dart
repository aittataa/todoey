import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/bounce_point.dart';
import '../widgets/collection_shape.dart';
import '../widgets/date_item.dart';
import '../widgets/empty_box.dart';
import '../widgets/floating_button.dart';

class Home extends StatefulWidget {
  final HomeController controller;
  const Home({Key? key, required this.controller}) : super(key: key);
  @override
  State<Home> createState() => _HomeState(controller);
}

class _HomeState extends State<Home> {
  final HomeController controller;
  _HomeState(this.controller);

  late bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.appTitle)),
      floatingActionButton: FloatingButton(
        visible: visible,
        backgroundColor: AppTheme.mainColor,
        foregroundColor: AppTheme.primaryIconColor,
        onPress: () {
          setState(() => {AppFunction.animateToPage(1)});
        },
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            if (!visible) setState(() => {visible = true});
          } else if (notification.direction == ScrollDirection.reverse) {
            if (visible) setState(() => {visible = false});
          }
          return true;
        },
        child: FutureBuilder<List<Collection>>(
          future: controller.getCollections,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                final List<Collection> collections = snapshot.data!;
                return GroupedListView<dynamic, DateTime>(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const BouncingScrollPhysics(),
                  elements: collections,
                  order: GroupedListOrder.ASC,
                  groupBy: (collection) {
                    return DateTime.utc(collection.date.year, collection.date.month, collection.date.day);
                  },
                  groupComparator: (a, b) => b.compareTo(a),
                  itemComparator: (a, b) => b.date.compareTo(a.date),
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
                    return GestureDetector(
                      onTap: () {
                        setState(() => {AppFunction.animateToPage(1)});
                      },
                      child: CollectionShape(
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
                      ),
                    );
                  },
                );
              }
              return const EmptyBox();
            }
            return const BouncePoint();
          },
        ),
      ),
    );
  }
}
