import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:to_do_list/app/config/app_message.dart";
import "package:to_do_list/app/config/app_theme.dart";

class EmptyBox extends StatelessWidget {
  final String label;
  const EmptyBox({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image.asset(
            AppMessage.appLogo,
            width: 100,
            height: 100,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.secondaryTextColor,
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
