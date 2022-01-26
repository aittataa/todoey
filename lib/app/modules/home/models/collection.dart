collectionsFromMap(map) {
  return List<Collection>.from(map.map((value) => Collection.fromMap(value)));
}

class Collection {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  late bool? status;
  final int? collectionId;

  Collection({
    this.id,
    this.title,
    this.description,
    this.date,
    this.status,
    this.collectionId,
  });

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      date: DateTime.parse(map['date']),
      status: map["status"] == 1,
      collectionId: map["collection_id"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "status": status,
      "collection_id": collectionId,
    };
  }

  get updateStatus => {status = !status!};
}
