import "package:flutter/cupertino.dart";

import "../../../config/app_constant.dart";
import "../../../config/app_theme.dart";

class CheckedBox extends StatelessWidget {
  final bool state;
  final Function()? onTap;

  const CheckedBox({
    super.key,
    this.state = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 50,
        height: 50,
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: AppConstant.durationCheck,
          curve: AppConstant.curve,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: state ? AppTheme.main_color_1 : AppTheme.transparent_color,
            border: Border.all(width: 2, color: AppTheme.main_color_1),
          ),
          child: Icon(
            CupertinoIcons.checkmark_alt,
            color: state ? AppTheme.icon_color_2 : AppTheme.transparent_color,
          ),
        ),
      ),
    );
  }
}
