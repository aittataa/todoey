import 'package:flutter/material.dart';

import '../../../config/themes/app_theme.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onPressed;

  const ActionButton({
    Key? key,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon, size: 30),
      elevation: 1,
      highlightElevation: 1,
      backgroundColor: backgroundColor ?? AppTheme.mainColor,
      foregroundColor: foregroundColor ?? AppTheme.primaryIconColor,
      splashColor: AppTheme.transparentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
