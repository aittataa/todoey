import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/constants/app_constant.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';

import '../../../config/themes/app_theme.dart';
import '../models/collection.dart';
import 'checked_box.dart';

class CollectionShape extends StatefulWidget {
  final HomeController controller;
  final Collection collection;
  const CollectionShape({required this.controller, required this.collection});
  @override
  State<CollectionShape> createState() => _CollectionShapeState(controller, collection);
}

class _CollectionShapeState extends State<CollectionShape> {
  final HomeController controller;
  final Collection collection;
  _CollectionShapeState(this.controller, this.collection);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        leading: CheckedBox(
          state: collection.status!,
          onTap: () async {
            setState(() => {collection.updateStatus});
            final data = await controller.updateCollection(collection);
            print(data);
          },
        ),
        title: Text(
          "${collection.title}",
          style: TextStyle(
            color: AppTheme.primaryTextColor,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
        subtitle: Text(
          "${collection.description}",
          style: TextStyle(
            color: AppTheme.secondaryTextColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
