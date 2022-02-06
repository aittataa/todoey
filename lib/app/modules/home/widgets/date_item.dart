import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/app_function.dart';

import '../../../config/app_theme.dart';

class DateItem extends StatelessWidget {
  final bool? state;
  final DateTime date;
  const DateItem({
    Key? key,
    this.state,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = date == DateTime.now().toUtc();
    switch (state) {
      case true:
        return SizedBox();
      case false:
        return SizedBox();
      default:
        return SizedBox();
    }
    return Center(
      child: Container(
        width: 120,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.mainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          state ? "Today" : "${AppFunction.dateShape(date)}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
