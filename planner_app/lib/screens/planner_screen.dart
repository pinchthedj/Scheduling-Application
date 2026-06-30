import 'package:flutter/material.dart';
import '../services/pdf_service.dart';
import '../widgets/monthly_calendar.dart';
import '../widgets/weekly_calendar.dart';
import '../widgets/task_card.dart';
import '../models/task.dart';
import '../services/local_storage.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  DateTime selectedDay = DateTime.now();
  bool showMonthly = true;

  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();

    final storedTasks = LocalStorage.loadTasks();

    tasks = storedTasks.isNotEmpty
        ? storedTasks
        : [
            Task(title: 'Morning routine', priority: Priority.low),
            Task(title: 'Work on project', priority: Priority.high),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  showMonthly ? 'Monthly View' : 'Weekly View',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.picture_as_pdf),
                      onPressed: () {
                        PdfService.exportTasks(tasks: tasks, date: selectedDay);
                      },
                    ),
                    Switch(
                      value: showMonthly,
                      onChanged: (value) {
                        setState(() {
                          showMonthly = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            showMonthly
                ? MonthlyCalendar(
                    selectedDay: selectedDay,
                    onDaySelected: (day) {
                      setState(() => selectedDay = day);
                    },
                  )
                : WeeklyCalendar(
                    selectedDay: selectedDay,
                    onDaySelected: (day) {
                      setState(() => selectedDay = day);
                    },
                  ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add task logic
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Task'),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, i) {
                return TaskCard(
                  task: tasks[i],
                  onToggle: () {
                    setState(() {
                      tasks[i].completed = !tasks[i].completed;
                    });

                    LocalStorage.saveTasks(tasks);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
