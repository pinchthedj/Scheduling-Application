import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskCard({super.key, required this.task, required this.onToggle});

  Color get priorityColor {
    switch (task.priority) {
      case Priority.high:
        return Colors.redAccent;
      case Priority.medium:
        return Colors.orangeAccent;
      case Priority.low:
        return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: task.completed ? 0.4 : 1,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: GestureDetector(
              onTap: onToggle,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: task.completed
                    ? const Icon(
                        Icons.check_circle,
                        key: ValueKey('done'),
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.radio_button_unchecked,
                        key: ValueKey('todo'),
                        color: Colors.grey,
                      ),
              ),
            ),
            title: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                decoration: task.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: task.completed ? Colors.grey : Colors.black,
                fontSize: 16,
              ),
              child: Text(task.title),
            ),
            trailing: CircleAvatar(radius: 6, backgroundColor: priorityColor),
          ),
        ),
      ),
    );
  }
}
