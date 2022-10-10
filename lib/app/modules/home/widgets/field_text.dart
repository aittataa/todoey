import "package:flutter/material.dart";

import "../../../config/app_theme.dart";

class FieldText extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int maxLines;

  const FieldText({
    super.key,
    this.controller,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: AppTheme.mainColor,
      maxLines: maxLines,
      style: TextStyle(
        color: AppTheme.primaryTextColor.withOpacity(.75),
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.5),
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      ),
    );
  }
}
