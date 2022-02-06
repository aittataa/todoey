import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/app_constant.dart';
import '../../../config/app_function.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import 'checked_box.dart';

class CollectionShape extends StatefulWidget {
  final HomeController controller;
  final Collection collection;
  final Function()? onPressed;
  const CollectionShape({
    required this.controller,
    required this.collection,
    this.onPressed,
  });
  @override
  State<CollectionShape> createState() => _CollectionShapeState(controller, collection, onPressed);
}

class _CollectionShapeState extends State<CollectionShape> {
  final HomeController controller;
  final Collection collection;
  final Function()? onDelete;
  _CollectionShapeState(this.controller, this.collection, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: collection.status ? .5 : 1,
      child: Container(
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
            state: collection.status,
            onTap: () async {
              setState(() => {collection.updateStatus});
              final data = await controller.updateCollection(collection);
              //print(data);
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
          subtitle: Row(
            children: [
              Expanded(
                child: Text(
                  "${collection.description}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.secondaryTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Text(
                "${AppFunction.timeShape(collection.date!)}",
                style: TextStyle(
                  color: AppTheme.secondaryTextColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: onDelete,
            padding: EdgeInsets.zero,
            color: AppTheme.primaryColor,
            highlightColor: AppTheme.transparentColor,
            splashColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.delete_solid),
          ),
        ),
      ),
    );
  }
}
