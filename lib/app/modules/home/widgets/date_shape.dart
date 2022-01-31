import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/app_constant.dart';
import 'package:to_do_list/app/config/app_theme.dart';

class DateShape extends StatelessWidget {
  final String label;
  final Color color;
  final bool state;
  final Function()? onTap;
  const DateShape({
    Key? key,
    required this.label,
    required this.color,
    this.state = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
        decoration: BoxDecoration(
          color: color.withOpacity(.25),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppTheme.primaryTextColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 10),
            if (state)
              AnimatedContainer(
                padding: EdgeInsets.all(2.5),
                alignment: Alignment.center,
                duration: AppConstant.durationAnimated,
                curve: AppConstant.curve,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(width: 2, color: color),
                ),
                child: Icon(
                  CupertinoIcons.checkmark,
                  color: AppTheme.primaryIconColor,
                  size: 15,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
