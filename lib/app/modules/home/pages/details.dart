import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/functions/app_function.dart';
import 'package:to_do_list/app/config/messages/app_message.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';
import 'package:to_do_list/app/modules/home/widgets/action_button.dart';

import '../controllers/home_controller.dart';
import '../widgets/field_text.dart';

class Details extends StatefulWidget {
  final HomeController controller;
  //final Collection collection;
  final bool state;
  const Details({
    Key? key,
    required this.controller,
    //required this.collection,
    this.state = false,
  }) : super(key: key);
  @override
  State<Details> createState() => _DetailsState(controller);
}

class _DetailsState extends State<Details> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  //final TextEditingController subTask = TextEditingController();

  ///
  final HomeController controller;
  //final Collection collection;
  _DetailsState(this.controller);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
            final Collection collection = Collection(title: title, description: desc);
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
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
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
