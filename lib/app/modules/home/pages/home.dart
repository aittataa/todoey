import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/app/config/constants/app_constant.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
import 'package:to_do_list/app/modules/home/widgets/action_button.dart';
import 'package:to_do_list/app/modules/home/widgets/checked_box.dart';
import 'package:to_do_list/app/modules/home/widgets/empty_box.dart';

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

class CollectionShape extends StatefulWidget {
  final bool state;
  final Collection collections;
  const CollectionShape({Key? key, required this.collections, this.state = false}) : super(key: key);

  @override
  State<CollectionShape> createState() => _CollectionShapeState(state, collections);
}

class _CollectionShapeState extends State<CollectionShape> {
  final bool state;
  final Collection collections;
  _CollectionShapeState(this.state, this.collections);

  final bool etat = true;

  @override
  Widget build(BuildContext context) {
    //if (etat) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryBackColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [AppConstant.boxShadow],
            ),
            child: ListTile(
              dense: !state,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              minLeadingWidth: 0,
              leading: CheckedBox(
                state: collections.status!,
              ),
              title: Text(
                "${collections.id} ${collections.title}",
                style: TextStyle(
                  color: AppTheme.primaryTextColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(
                "${collections.description}",
                style: TextStyle(
                  color: AppTheme.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          if (state)
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: collections.myList!.length,
              itemBuilder: (context, i) {
                final Collection collection = collections.myList![i];
                return CollectionShape(collections: collection);
              },
            ),
        ],
      ),
    );
    /*
    } else {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppTheme.primaryBackColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [AppConstant.boxShadow],
        ),
        child: ExpansionTile(
          maintainState: true,
          initiallyExpanded: true,
          backgroundColor: AppTheme.transparentColor,
          collapsedBackgroundColor: AppTheme.transparentColor,
          iconColor: AppTheme.mainColor,
          collapsedIconColor: AppTheme.secondaryIconColor.withOpacity(.5),
          tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          childrenPadding: EdgeInsets.zero,
          leading: CheckedBox(
            state: collections.status!,
          ),
          title: Text(
            "${collections.id} ${collections.title}",
            style: TextStyle(
              color: AppTheme.primaryTextColor,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          subtitle: Text(
            "${collections.description}",
            style: TextStyle(
              color: AppTheme.secondaryTextColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          children: List.generate(collections.myList!.length, (i) {
            return Container(color: Colors.red, child: Text("${i.toString()}"));
          }),
        ),
      );
    }
    */
  }
}
