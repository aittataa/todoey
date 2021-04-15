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

  void updateTaskState() {
    status = !status;
  }
}
