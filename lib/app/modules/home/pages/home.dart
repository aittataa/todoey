import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';

class Home extends StatelessWidget {
  final HomeController controller;
  const Home({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final Collection collection = Collection(
              title: "My Collection",
              date: DateTime.now(),
              status: true,
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
          return Center(child: Text("${collections.length}"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(CupertinoIcons.plus_app, size: 25),
        elevation: 1,
        highlightElevation: 1,
        backgroundColor: AppTheme.mainColor,
        splashColor: AppTheme.transparentColor,
        foregroundColor: AppTheme.secondaryIconColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
