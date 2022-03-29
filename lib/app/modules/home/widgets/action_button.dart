// import 'package:flutter/material.dart';
//
// import '../../../config/app_message.dart';
// import '../../../config/app_theme.dart';
//
// class ActionButton extends StatelessWidget {
//   final IconData? icon;
//   final Color backgroundColor;
//   final Color foregroundColor;
//   final Function()? onPressed;
//
//   const ActionButton({
//     Key? key,
//     this.icon,
//     required this.backgroundColor,
//     required this.foregroundColor,
//     this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: onPressed,
//       child: Image.asset(
//         AppMessage.appLogo,
//         color: AppTheme.primaryIconColor,
//         height: 40,
//       ),
//       elevation: 1,
//       highlightElevation: 1,
//       backgroundColor: backgroundColor,
//       foregroundColor: foregroundColor,
//       splashColor: AppTheme.transparentColor,
//     );
//   }
// }
