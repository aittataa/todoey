import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/app_message.dart';
import 'package:to_do_list/app/config/app_theme.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AppMessage.appLogo,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(height: 20),
        Text(
          AppMessage.noDataFound,
          style: TextStyle(
            color: AppTheme.secondaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
