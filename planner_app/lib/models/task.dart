enum Priority { high, medium, low }

class Task {
  String title;
  bool completed;
  Priority priority;

  Task({
    required this.title,
    this.completed = false,
    this.priority = Priority.low,
  });
}
