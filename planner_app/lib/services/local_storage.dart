import 'package:hive/hive.dart';
import '../models/task.dart';

class LocalStorage {
  static final _box = Hive.box('plannerBox');

  // Save tasks
  static Future<void> saveTasks(List<Task> tasks) async {
    final data = tasks
        .map(
          (t) => {
            'title': t.title,
            'completed': t.completed,
            'priority': t.priority.index,
          },
        )
        .toList();

    await _box.put('tasks', data);
  }

  // Load tasks
  static List<Task> loadTasks() {
    final data = _box.get('tasks', defaultValue: []);

    return data.map<Task>((t) {
      return Task(
        title: t['title'],
        completed: t['completed'],
        priority: Priority.values[t['priority']],
      );
    }).toList();
  }
}
