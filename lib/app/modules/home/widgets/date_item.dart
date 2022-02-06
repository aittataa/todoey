import 'package:flutter/cupertino.dart';
import 'package:to_do_list/app/config/app_function.dart';
import 'package:to_do_list/app/config/app_theme.dart';

class DateItem extends StatelessWidget {
  final DateTime date;
  const DateItem({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.mainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "${AppFunction.dateShape(date)}",
          style: TextStyle(
            color: AppTheme.textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
