import 'package:flutter/material.dart';
import 'planner_screen.dart';
import 'notes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = const [PlannerScreen(), NotesScreen()];

  @override
  Widget build(BuildContext context) {
    return
    
     Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Planner',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Notes'),
        ],
      ),
    );
  }
}
