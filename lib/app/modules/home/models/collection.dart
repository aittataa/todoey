class Collection {
  final int? id;
  final String? title;
  final DateTime? date;
  late bool? status;

  Collection({this.id, this.title, this.date, this.status});

  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      status: map['status'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "status": status,
    };
  }

  void updateState() => {status = !status!};
}
