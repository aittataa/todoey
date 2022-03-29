import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../config/app_constant.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';

class FloatingButton extends StatelessWidget {
  final bool visible;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function()? onPress;

  const FloatingButton({
    Key? key,
    this.visible = true,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      onPress: onPress,
      visible: visible,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      activeForegroundColor: AppTheme.transparentColor,
      activeBackgroundColor: AppTheme.transparentColor,
      overlayColor: AppTheme.transparentColor,
      elevation: 1,
      overlayOpacity: 0,
      curve: AppConstant.curve,
      child: Image.asset(
        AppMessage.appLogo,
        color: AppTheme.primaryIconColor,
        height: 40,
      ),
    );
  }
}
