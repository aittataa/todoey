import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

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
      body: SafeArea(
        child: Obx(() {
          final bool state = controller.state.value;
          if (state) {
            return BouncePoint();
          } else {
            // final map = controller.collectionsss;
            final List<Collection> collections = controller.collections;
            final List<Collection> myList = collections..sort((a, b) => b.id!.compareTo(a.id!));
            final bool isEmpty = myList.isEmpty;
            if (isEmpty) {
              return EmptyBox();
            } else {
              return HomeBody(myList: myList);
              // return SizedBox();
            }
          }
        }),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final List<Collection> myList;
  const HomeBody({Key? key, required this.myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return GroupListView(
      sectionsCount: myList.length,
      countOfItemInSection: (section) {
        return myList.length;
      },
      groupHeaderBuilder: (context, index) {
        return Text(
          myList[index].date.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        );
      },
      itemBuilder: (context, index) {
        return Text(
          myList[index.section].title!,
          style: TextStyle(color: Colors.red, fontSize: 18),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
    );*/
    /*return StickyGroupedListView<dynamic, DateTime>(
      elements: myList,
      groupBy: (collection) => collection.date,
      groupSeparatorBuilder: (date) => GroupSeparator(date: date),
      order: StickyGroupedListOrder.ASC, // optional
      itemBuilder: (context, dynamic collection) => Text(collection.title!),
      // itemComparator: (a, b) => b.title!.compareTo(a.title!), // optional
      // useStickyGroupSeparators: true, // optional
      floatingHeader: true, // optional
      //
    );*/

    return GroupedListView<dynamic, DateTime>(
      elements: myList,
      groupBy: (collection) => collection.date,
      groupSeparatorBuilder: (DateTime date) => GroupSeparator(date: date),
      order: GroupedListOrder.ASC, // optional
      itemBuilder: (context, dynamic collection) => Text(collection.title!),
      itemComparator: (a, b) => b.date!.compareTo(a.date!), // optional
      useStickyGroupSeparators: true, // optional
      floatingHeader: true, // optional
      //
    );

    /*return ListView.builder(
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
    );*/
  }
}

class GroupSeparator extends StatelessWidget {
  final DateTime date;
  const GroupSeparator({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          "${this.date.day}/${this.date.month}/${this.date.year}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
