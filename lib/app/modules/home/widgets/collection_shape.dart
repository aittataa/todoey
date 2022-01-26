import 'package:flutter/material.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';
import '../models/collection.dart';
import 'checked_box.dart';

class CollectionShape extends StatelessWidget {
  final bool state;
  final Collection collections;
  final List<Collection> myList;
  const CollectionShape({this.state = false, required this.collections, this.myList = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                state: collections.status!,
                onTap: () {},
              ),
              title: Text(
                "${collections.id} - ${collections.title}",
                style: TextStyle(
                  color: AppTheme.primaryTextColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(
                "${collections.description}   :${collections.collectionId}",
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
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: myList.length,
            itemBuilder: (context, i) {
              final Collection collection = myList[i];
              return CollectionShape(
                state: false,
                collections: collection,
              );
            },
          ),
        ],
      ),
    );
  }
}
