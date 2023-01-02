import "dart:developer";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../config/app_function.dart";
import "../../../config/app_message.dart";
import "../../../config/app_theme.dart";
import "../controllers/home_controller.dart";
import "../models/collection.dart";
import "../widgets/date_shape.dart";
import "../widgets/edit_text.dart";
import "../widgets/floating_button.dart";

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final HomeController controller = Get.put(HomeController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    stateDate = -1;
  }

  late bool visible = true;
  late int stateDate = -1;
  late DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    visible = MediaQuery.of(context).viewInsets.bottom == 0;
    return WillPopScope(
      onWillPop: () async {
        setState(() => <void>{FocusScope.of(context).unfocus()});
        AppFunction.animateToPage(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: EdgeInsets.zero,
            color: AppTheme.icon_color_1,
            highlightColor: AppTheme.transparent_color,
            splashColor: AppTheme.transparent_color,
            icon: const Icon(CupertinoIcons.back),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              AppFunction.animateToPage(0);
              setState(() {});
            },
          ),
          title: const Text(AppMessage.labelNewTask),
        ),
        floatingActionButton: FloatingButton(
          visible: visible,
          backgroundColor: AppTheme.main_color_3,
          foregroundColor: AppTheme.icon_color_2,
          onPress: () async {
            final String title = titleController.text;
            final String desc = descController.text;
            if (title.isNotEmpty || desc.isNotEmpty) {
              final Collection collection = Collection(
                title: title,
                description: desc,
                date: selectedDate,
              );
              final int data = await controller.createCollection(collection);
              log(data.toString());
            }
            setState(() => <void>{FocusScope.of(context).unfocus()});
            AppFunction.animateToPage(0);
          },
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  DateShape(
                    state: stateDate == 0,
                    label: AppMessage.labelToday,
                    color: AppTheme.main_color_1,
                    onTap: () {
                      stateDate = 0;
                      selectedDate = DateTime.now();
                      setState(() {});
                    },
                  ),
                  DateShape(
                    state: stateDate == 1,
                    label: AppMessage.labelTomorrow,
                    color: AppTheme.main_color_2,
                    onTap: () {
                      stateDate = 1;
                      selectedDate = DateTime.now().add(1.days);
                      setState(() {});
                    },
                  ),
                  DateShape(
                    state: stateDate == 2,
                    label: AppMessage.labelScheduled,
                    color: AppTheme.main_color_3,
                    onTap: () async {
                      stateDate = 2;
                      FocusScope.of(context).unfocus();
                      selectedDate = await AppFunction.pickDate(context);
                      log(selectedDate.toString());
                      /*AppFunction.pickScheduledDate(
                        context,
                        onDateTimeChanged: (DateTime date) {
                          selectedDate = DateTime.utc(
                            date.year,
                            date.month,
                            date.day,
                            DateTime.now().hour,
                            DateTime.now().minute,
                            DateTime.now().second,
                          );
                        },
                      );*/
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            EditText(
              controller: titleController,
              hint: AppMessage.labelHintTitle,
            ),
            const SizedBox(height: 10),
            EditText(
              controller: descController,
              hint: AppMessage.labelHintDescription,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
