import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
import '../widgets/field_text.dart';

class Details extends StatefulWidget {
  final HomeController controller;
  const Details({Key? key, required this.controller}) : super(key: key);
  @override
  State<Details> createState() => _DetailsState(controller);
}

class _DetailsState extends State<Details> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final HomeController controller;
  _DetailsState(this.controller);

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          color: AppTheme.secondaryIconColor,
          highlightColor: AppTheme.transparentColor,
          splashColor: AppTheme.transparentColor,
          icon: Icon(CupertinoIcons.back),
          onPressed: () async {
            setState(() {
              FocusScope.of(context).unfocus();
              AppFunction.animateToPage(0);
            });
          },
        ),
        title: Text(AppMessage.newTask),
      ),
      floatingActionButton: ActionButton(
        icon: CupertinoIcons.checkmark_alt,
        backgroundColor: AppTheme.secondaryColor,
        foregroundColor: AppTheme.primaryIconColor,
        onPressed: () async {
          final String title = titleController.text;
          final String desc = descController.text;
          if (title.isNotEmpty || desc.isNotEmpty) {
            final Collection collection = Collection(
              title: title,
              description: desc,
              date: selectedDate,
            );
            final data = await controller.createCollection(collection);
            print(data);
          }
          setState(() {
            FocusScope.of(context).unfocus();
            AppFunction.animateToPage(0);
          });
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedDate = DateTime.now();
                      print(selectedDate);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppTheme.mainColor.withOpacity(.25),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppTheme.mainColor, width: 2),
                      ),
                      child: Text(
                        "Today",
                        style: TextStyle(
                          color: AppTheme.primaryTextColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedDate = DateTime.now().add(Duration(days: 1));
                      print(selectedDate);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(.25),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppTheme.primaryColor, width: 2),
                      ),
                      child: Text(
                        "Tomorrow",
                        style: TextStyle(
                          color: AppTheme.primaryTextColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      AppFunction.pickScheduledDate(
                        context,
                        onDateTimeChanged: (value) {
                          selectedDate = value;
                          print(selectedDate);
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryColor.withOpacity(.25),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppTheme.secondaryColor, width: 2),
                      ),
                      child: Text(
                        "Scheduled",
                        style: TextStyle(
                          color: AppTheme.primaryTextColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FieldText(
              controller: titleController,
              hint: "Type Task Title",
              onChanged: (value) {
                setState(() {});
              },
            ),
            FieldText(
              controller: descController,
              hint: "Description (OPTIONAL)",
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
