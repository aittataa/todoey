import "package:flutter/material.dart";

import "../../../config/app_theme.dart";

class EditText extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int maxLines;

  const EditText({
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
      cursorColor: AppTheme.main_color_1,
      maxLines: maxLines,
      style: const TextStyle(
        color: AppTheme.text_color_1,
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppTheme.text_color_3,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      ),
    );
  }
}
