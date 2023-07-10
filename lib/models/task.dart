class Task {
  String content;
  DateTime date;
  bool isComplete;

  Task({
    required this.content,
    required this.date,
    required this.isComplete,
  });

  factory Task.fromMap(Map task) {
    return Task(
        content: task['content'],
        date: task['data'],
        isComplete: task['isComplete']);
  }

  Map asMap() {
    return {"content": content, "date": date, "isComplete": isComplete};
  }
}
