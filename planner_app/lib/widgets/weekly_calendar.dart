import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyCalendar extends StatelessWidget {
  final DateTime selectedDay;
  final ValueChanged<DateTime> onDaySelected;

  const WeeklyCalendar({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final startOfWeek = selectedDay.subtract(
      Duration(days: selectedDay.weekday - 1),
    );

    return SingleChildScrollView(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            final day = startOfWeek.add(Duration(days: index));
            final isSelected =
                day.day == selectedDay.day && day.month == selectedDay.month;

            return GestureDetector(
              onTap: () => onDaySelected(day),
              child: Container(
                width: 70,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.purple : Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.E().format(day),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      day.day.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
