import 'package:flutter/cupertino.dart';

import '../../../config/app_constant.dart';
import '../../../config/app_theme.dart';

class CheckedBox extends StatelessWidget {
  final bool state;
  final Function()? onTap;
  const CheckedBox({
    Key? key,
    this.state = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 50,
        height: 50,
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: AppConstant.durationCheck,
          curve: AppConstant.curve,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: state ? AppTheme.mainColor : AppTheme.transparentColor,
            border: Border.all(width: 2, color: AppTheme.mainColor),
          ),
          child: Icon(
            CupertinoIcons.checkmark_alt,
            color: state ? AppTheme.primaryIconColor : AppTheme.transparentColor,
          ),
        ),
      ),
    );
  }
}
