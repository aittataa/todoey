collectionsFromMap(List<Map<String, dynamic>> map) {
  return List<Collection>.from(map.map((Map<String, dynamic> value) => Collection.fromMap(value)));
}

class Collection {
  late int? id;
  late String? title;
  late String? description;
  late DateTime? date;
  late bool status;
  late int collectionId;

  Collection({
    this.id,
    this.title,
    this.description,
    this.date,
    this.status = false,
    this.collectionId = 0,
  });

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      date: DateTime.parse(map["date"]),
      status: map["status"] == 1,
      collectionId: map["collection_id"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date!.toIso8601String(),
      "status": status ? 1 : 0,
      "collection_id": collectionId,
    };
  }

  get updateStatus => <bool>{status = !status};
}
