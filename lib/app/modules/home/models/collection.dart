import 'package:hive/hive.dart';

part 'collection.g.dart';

@HiveType(typeId: 0)
class Collection extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final DateTime? date;

  @HiveField(3)
  late bool? status;

  @HiveField(4)
  final List<Collection>? myList;

  Collection({this.id, this.title, this.date, this.status, this.myList});

  // factory Collection.fromMap(Map<String, dynamic> map) {
  //   return Collection(
  //     id: map['id'],
  //     title: map['title'],
  //     date: DateTime.parse(map['date']),
  //     status: map['status'] == 1,
  //     myList: [],
  //   );
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "title": title,
  //     "status": status,
  //   };
  // }
  //
  // void updateState() => {status = !status!};
}
