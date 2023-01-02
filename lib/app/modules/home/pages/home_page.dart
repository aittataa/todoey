import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:get/get.dart";
import "package:grouped_list/grouped_list.dart";

import "../../../config/app_function.dart";
import "../../../config/app_message.dart";
import "../../../config/app_theme.dart";
import "../controllers/home_controller.dart";
import "../models/collection.dart";
import "../widgets/bounce_point.dart";
import "../widgets/collection_shape.dart";
import "../widgets/date_item.dart";
import "../widgets/empty_box.dart";
import "../widgets/floating_button.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  late bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppMessage.appTitle)),
      floatingActionButton: FloatingButton(
        visible: visible,
        backgroundColor: AppTheme.main_color_1,
        foregroundColor: AppTheme.icon_color_2,
        onPress: () {
          AppFunction.animateToPage(1);
          setState(() {});
        },
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification notification) {
          if (notification.direction == ScrollDirection.forward) {
            if (!visible) visible = true;
          } else if (notification.direction == ScrollDirection.reverse) {
            if (visible) visible = false;
          }
          setState(() {});
          return true;
        },
        child: FutureBuilder<List<Collection>>(
          future: controller.getCollections,
          builder: (_, AsyncSnapshot<List<Collection>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const SizedBox();
              case ConnectionState.waiting:
                return const BouncePoint();
              case ConnectionState.active:
                return const SizedBox();
              case ConnectionState.done:
                if (snapshot.hasError) return const EmptyBox(label: AppMessage.labelSomethingWrong);
                if (!snapshot.hasData) return const EmptyBox(label: AppMessage.labelNoDataFound);
                if (snapshot.data!.isEmpty) return const EmptyBox(label: AppMessage.labelEmptyList);
                final List<Collection> collections = snapshot.data!;
                return GroupedListView<dynamic, DateTime>(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const BouncingScrollPhysics(),
                  elements: collections,
                  order: GroupedListOrder.ASC,
                  groupBy: (dynamic collection) {
                    return DateTime.utc(collection.date.year, collection.date.month, collection.date.day);
                  },
                  groupComparator: (DateTime a, DateTime b) => b.compareTo(a),
                  itemComparator: (a, b) => b.date.compareTo(a.date),
                  groupSeparatorBuilder: (DateTime date) {
                    if (date == DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day)) {
                      return DateItem(label: AppMessage.labelToday, date: date);
                    }
                    return DateItem(label: AppFunction.dateShape(date), date: date);
                  },
                  itemBuilder: (BuildContext context, dynamic collection) {
                    return CollectionShape(
                      controller: controller,
                      collection: collection,
                      onUpdate: () async {
                        collection.updateStatus;
                        final int data = await controller.updateCollection(collection);
                        log(data.toString());
                        setState(() {});
                      },
                      onDelete: () async {
                        final int id = collection.id!;
                        collections.remove(collection);
                        final int data = await controller.deleteCollection(id);
                        log(data.toString());
                        setState(() {});
                      },
                    );
                  },
                );
              default:
                return const BouncePoint();
            }
          },
        ),
      ),
    );
  }
}
