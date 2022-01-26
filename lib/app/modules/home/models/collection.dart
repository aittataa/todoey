import 'package:hive/hive.dart';

class Collection extends HiveObject {
  late int id;
  final String? title;
  final String? description;
  final DateTime? date;
  late bool? status;
  final List<Collection>? myList;

  Collection({
    this.title,
    this.description,
    this.date,
    this.status,
    this.myList,
  });

  get updateStatus => {status = !status!};
}
