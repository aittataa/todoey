import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/action_button.dart';
import '../widgets/date_shape.dart';
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
  late int stateDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    stateDate = -1;
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
      body: ListView(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DateShape(
                  state: stateDate == 0,
                  label: "Today",
                  color: AppTheme.mainColor,
                  onTap: () {
                    setState(() => {stateDate = 0});
                    selectedDate = DateTime.now();
                    print(selectedDate);
                  },
                ),
                DateShape(
                  state: stateDate == 1,
                  label: "Tomorrow",
                  color: AppTheme.primaryColor,
                  onTap: () {
                    setState(() => {stateDate = 1});
                    selectedDate = DateTime.now().add(Duration(days: 1));
                    print(selectedDate);
                  },
                ),
                DateShape(
                  state: stateDate == 2,
                  label: "Scheduled",
                  color: AppTheme.secondaryColor,
                  onTap: () {
                    setState(() => {stateDate = 2});
                    FocusScope.of(context).unfocus();
                    AppFunction.pickScheduledDate(
                      context,
                      onDateTimeChanged: (value) {
                        selectedDate = value;
                        print(selectedDate);
                      },
                    );
                  },
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
    );
  }
}
