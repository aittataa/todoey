import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';

class FieldText extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int maxLines;
  final bool state;
  final dynamic onChanged;

  const FieldText({
    Key? key,
    this.controller,
    required this.hint,
    this.maxLines = 1,
    this.state = true,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        cursorColor: AppTheme.mainColor,
        maxLines: maxLines,
        style: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.75),
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
        ),
        // scrollPadding: EdgeInsets.zero,
        decoration: InputDecoration(
          // filled: false,
          // fillColor: AppTheme.TextFieldBackColor.withOpacity(.025),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.5),
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          border: InputBorder.none,
          // enabledBorder: UnderlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(color: AppTheme.transparentColor),
          // ),
          // focusedBorder: UnderlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(color: AppTheme.transparentColor),
          // ),
        ),
      ),
    );
  }
}
