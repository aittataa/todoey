import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/app_function.dart';
import '../../../config/app_message.dart';
import '../../../config/app_theme.dart';
import '../controllers/home_controller.dart';
import '../models/collection.dart';
import '../widgets/date_shape.dart';
import '../widgets/field_text.dart';
import '../widgets/floating_button.dart';

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

  late bool visible = true;
  late DateTime selectedDate = DateTime.now();
  late int stateDate = -1;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    stateDate = -1;
  }

  @override
  Widget build(BuildContext context) {
    visible = MediaQuery.of(context).viewInsets.bottom == 0;
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
      floatingActionButton: FloatingButton(
        visible: visible,
        backgroundColor: AppTheme.secondaryColor,
        foregroundColor: AppTheme.primaryIconColor,
        onPress: () async {
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DateShape(
                  state: stateDate == 0,
                  label: AppMessage.labelToday,
                  color: AppTheme.mainColor,
                  onTap: () {
                    setState(() => {stateDate = 0});
                    selectedDate = DateTime.now();
                  },
                ),
                DateShape(
                  state: stateDate == 1,
                  label: AppMessage.labelTomorrow,
                  color: AppTheme.primaryColor,
                  onTap: () {
                    setState(() => {stateDate = 1});
                    selectedDate = DateTime.now().add(Duration(days: 1));
                  },
                ),
                DateShape(
                  state: stateDate == 2,
                  label: AppMessage.labelScheduled,
                  color: AppTheme.secondaryColor,
                  onTap: () {
                    setState(() => {stateDate = 2});
                    FocusScope.of(context).unfocus();
                    AppFunction.pickScheduledDate(
                      context,
                      onDateTimeChanged: (DateTime date) {
                        selectedDate = DateTime.utc(date.year, date.month, date.day, DateTime.now().hour, DateTime.now().minute, DateTime.now().second);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          FieldText(
            controller: titleController,
            hint: AppMessage.hintTitle,
            onChanged: (value) {
              setState(() {});
            },
          ),
          FieldText(
            controller: descController,
            hint: AppMessage.hintDescription,
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
