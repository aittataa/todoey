import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/constants/app_constant.dart';

import '../../../config/themes/app_theme.dart';
import '../models/collection.dart';
import 'checked_box.dart';

class CollectionShape extends StatefulWidget {
  final bool state;
  final Collection collection;
  final List<Collection> myList;
  const CollectionShape({this.state = false, required this.collection, this.myList = const []});
  @override
  State<CollectionShape> createState() => _CollectionShapeState(this.state, this.collection, this.myList);
}

class _CollectionShapeState extends State<CollectionShape> {
  final bool state;
  final Collection collection;
  final List<Collection> myList;
  _CollectionShapeState(this.state, this.collection, this.myList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryBackColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [AppConstant.boxShadow],
          ),
          child: ListTile(
            dense: state,
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            leading: CheckedBox(
              state: collection.status!,
              onTap: () {
                setState(() {
                  collection.updateStatus;
                });
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
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20, top: 10),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: myList.length,
          itemBuilder: (context, i) {
            final Collection _collection = myList[i];
            return CollectionShape(
              state: true,
              collection: _collection,
            );
          },
        ),
      ],
    );
  }
}
