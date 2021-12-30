taskFromMap(var map) {
  return List<Task>.from(map.map((value) => Task.fromMap(value)));
}

class Task {
  int id;
  String title;
  DateTime date;
  bool status;

  Task({
    this.id,
    this.title,
    this.date,
    this.status = false,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
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

  void updateTaskState() => {status = !status};
}
