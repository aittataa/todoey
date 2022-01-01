import 'package:hive/hive.dart';

part 'collection.g.dart';

@HiveType(typeId: 0)
class Collection extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final DateTime? date;

  @HiveField(4)
  late bool? status;

  @HiveField(5)
  final List<Collection>? myList;

  Collection({
    this.id,
    this.title,
    this.description,
    this.date,
    this.status,
    this.myList,
  });
}
