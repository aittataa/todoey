import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/app/config/constants/app_constant.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
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
          final List<Collection> collections = box.values.toList().cast<Collection>();
          return HomeBody(
            collections: collections..sort((a, b) => b.id.compareTo(a.id)),
          );
        },
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onPressed;

  const ActionButton({
    Key? key,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon, size: 25),
      elevation: 1,
      highlightElevation: 1,
      backgroundColor: backgroundColor ?? AppTheme.mainColor,
      foregroundColor: foregroundColor ?? AppTheme.primaryIconColor,
      splashColor: AppTheme.transparentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class HomeBody extends StatefulWidget {
  final List<Collection> collections;
  const HomeBody({Key? key, required this.collections}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState(collections);
}

class _HomeBodyState extends State<HomeBody> {
  final List<Collection> collections;
  _HomeBodyState(this.collections);

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = collections.isEmpty;
    if (isEmpty) {
      return EmptyBox();
    } else {
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: collections.length,
        itemBuilder: (context, i) {
          final Collection myCollection = collections[i];

          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.primaryBackColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [AppConstant.boxShadow],
            ),
            child: ExpansionTile(
              // backgroundColor: AppTheme.transparentColor,
              // collapsedBackgroundColor: AppTheme.transparentColor,
              iconColor: AppTheme.mainColor,
              collapsedIconColor: AppTheme.secondaryIconColor.withOpacity(.5),
              tilePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              childrenPadding: EdgeInsets.zero,
              leading: CheckedBox(
                state: myCollection.status!,
                onTap: () {
                  setState(() => {myCollection.updateStatus});
                },
              ),
              title: Text(
                "${myCollection.id} ${myCollection.title}",
                style: TextStyle(
                  color: AppTheme.primaryTextColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(
                "${myCollection.description}",
                style: TextStyle(
                  color: AppTheme.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
