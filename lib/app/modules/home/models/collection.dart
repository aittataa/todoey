import 'package:hive/hive.dart';

part 'collection.g.dart';

@HiveType(typeId: 0)
class Collection extends HiveObject {
  static int _myIndex = 0;

  @HiveField(0)
  late int id;

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
    this.title,
    this.description,
    this.date,
    this.status,
    this.myList,
  }) {
    _myIndex++;
    id = _myIndex;
  }

  addCollection(Collection collection) {
    print(collection.myList?.first.title);
    return myList?.add(collection);
  }

  get updateStatus => {status = !status!};
}
