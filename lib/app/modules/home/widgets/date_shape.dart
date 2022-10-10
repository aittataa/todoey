import "package:flutter/cupertino.dart";

import "../../../config/app_constant.dart";
import "../../../config/app_theme.dart";

class DateShape extends StatelessWidget {
  final String label;
  final Color color;
  final bool state;
  final Function()? onTap;

  const DateShape({
    super.key,
    required this.label,
    required this.color,
    this.state = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstant.durationAnimated,
        curve: AppConstant.curve,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
        decoration: BoxDecoration(
          color: color.withOpacity(.25),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.primaryTextColor,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
              ),
            ),
            const SizedBox(width: 10),
            if (state)
              AnimatedContainer(
                duration: AppConstant.durationAnimated,
                curve: AppConstant.curve,
                padding: const EdgeInsets.all(2.5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(width: 2, color: color),
                ),
                child: const Icon(
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
