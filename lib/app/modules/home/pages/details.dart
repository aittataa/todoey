import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';

import '../../../config/functions/app_function.dart';
import '../../../config/messages/app_message.dart';
import '../controllers/home_controller.dart';
import '../widgets/field_text.dart';

class Details extends StatefulWidget {
  final HomeController controller;
  const Details({Key? key, required this.controller}) : super(key: key);
  @override
  State<Details> createState() => _DetailsState(controller);
}

class _DetailsState extends State<Details> {
  final HomeController controller;
  _DetailsState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMessage.newTask),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            setState(() {
              FocusScope.of(context).unfocus();
              AppFunction.animateToPage(0);
            });
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  FieldText(
                    hint: "Title",
                  ),
                  FieldText(
                    hint: "Description (OPTIONAL)",
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              minVerticalPadding: 0,
              horizontalTitleGap: 5,
              title: Expanded(
                child: FieldText(
                  hint: "Add SubTask",
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.secondaryColor,
                ),
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  color: AppTheme.primaryIconColor,
                  splashColor: AppTheme.transparentColor,
                  highlightColor: AppTheme.transparentColor,
                  icon: Icon(CupertinoIcons.checkmark_alt),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
