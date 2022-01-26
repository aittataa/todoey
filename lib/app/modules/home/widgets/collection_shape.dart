import 'package:flutter/material.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';
import '../models/collection.dart';
import 'checked_box.dart';

class CollectionShape extends StatefulWidget {
  final bool state;
  final Collection collections;
  const CollectionShape({
    Key? key,
    required this.collections,
    this.state = false,
  }) : super(key: key);

  @override
  State<CollectionShape> createState() => _CollectionShapeState(state, collections);
}

class _CollectionShapeState extends State<CollectionShape> {
  final bool state;
  final Collection collections;
  _CollectionShapeState(this.state, this.collections);

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
            dense: !state,
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            leading: CheckedBox(
              state: collections.status!,
              onTap: () {
                setState(() => {collections.updateStatus});
              },
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
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        if (state)
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: collections.myList!.length,
            itemBuilder: (context, i) {
              final Collection collection = (collections.myList!..sort((a, b) => b.id.compareTo(a.id)))[i];
              return Padding(
                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: CollectionShape(collections: collection),
              );
            },
          ),
      ],
    );
  }
}
