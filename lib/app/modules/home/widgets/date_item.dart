import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../../config/app_theme.dart";

class DateItem extends StatelessWidget {
  final String label;
  final DateTime date;
  const DateItem({
    Key? key,
    required this.label,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.mainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
