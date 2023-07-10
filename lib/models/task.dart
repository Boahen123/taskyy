import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(7, defaultValue: "")
  String? content;
  @HiveField(8)
  bool isComplete;
  @HiveField(9)
  String date;

  Task({
    required this.content,
    required this.date,
    required this.isComplete,
  });

  factory Task.fromMap(Map task) {
    return Task(
        content: task["content"],
        date: task["date"],
        isComplete: task["isComplete"]);
  }

  Map asMap() {
    return {"content": content, "date": date, "isComplete": isComplete};
  }
}
