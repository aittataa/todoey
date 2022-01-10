import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/config/functions/app_function.dart';
import 'package:to_do_list/app/config/themes/app_theme.dart';
import 'package:to_do_list/app/modules/home/models/collection.dart';

import '../../../config/messages/app_message.dart';
import '../controllers/home_controller.dart';
import '../widgets/field_text.dart';

class Details extends StatefulWidget {
  final HomeController controller;
  final Collection collection;
  final bool state;
  const Details({
    Key? key,
    required this.controller,
    required this.collection,
    this.state = false,
  }) : super(key: key);
  @override
  State<Details> createState() => _DetailsState(controller, collection);
}

class _DetailsState extends State<Details> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController subTask = TextEditingController();
  final HomeController controller;
  final Collection collection;
  _DetailsState(this.controller, this.collection);

  late Collection _collection = Collection(myList: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMessage.newTask),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () async {
            setState(() {
              FocusScope.of(context).unfocus();
              AppFunction.animateToPage(0);
            });
            if (_collection.title!.isNotEmpty) {
              var data = await controller.createCollection(_collection);
              print(data);
            }
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                children: [
                  FieldText(
                    controller: title,
                    hint: "Type Task Title",
                    onChanged: (value) {
                      setState(() {
                        _collection = Collection(title: title.text);
                      });
                    },
                  ),
                  FieldText(
                    controller: desc,
                    hint: "Add Description (OPTIONAL)",
                    maxLines: 5,
                    onChanged: (value) {
                      setState(() {
                        _collection = Collection(description: desc.text);
                      });
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _collection.myList?.length ?? 0,
                    itemBuilder: (context, i) {
                      return SizedBox(
                          child: Text(
                        "${_collection.myList?.length}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ));
                    },
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
                  controller: subTask,
                  hint: "Add SubTask",
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.secondaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _collection.myList!.add(Collection(title: subTask.text));
                    });
                  },
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
