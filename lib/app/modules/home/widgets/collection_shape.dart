import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../../config/app_constant.dart";
import "../../../config/app_function.dart";
import "../../../config/app_theme.dart";
import "../controllers/home_controller.dart";
import "../models/collection.dart";
import "checked_box.dart";

class CollectionShape extends StatelessWidget {
  final HomeController controller;
  final Collection collection;
  final Function()? onUpdate;
  final Function()? onDelete;
  const CollectionShape({
    super.key,
    required this.controller,
    required this.collection,
    this.onUpdate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: collection.status ? .5 : 1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppTheme.back_color_2,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[AppConstant.boxShadow],
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          leading: CheckedBox(
            state: collection.status,
            onTap: onUpdate,
          ),
          title: Text(
            "${collection.title}",
            style: const TextStyle(
              color: AppTheme.text_color_2,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "${collection.description}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppTheme.text_color_3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                AppFunction.timeShape(collection.date!),
                style: const TextStyle(
                  color: AppTheme.text_color_3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: onDelete,
            padding: EdgeInsets.zero,
            color: AppTheme.main_color_2,
            highlightColor: AppTheme.transparent_color,
            splashColor: AppTheme.transparent_color,
            icon: const Icon(CupertinoIcons.delete_solid),
          ),
        ),
      ),
    );
  }
}
