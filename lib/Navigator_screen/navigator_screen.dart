import 'package:flutter/material.dart';
import 'package:flutter_task_03/Home%20screen/Profile%20screen/profile_screen.dart';
import 'package:flutter_task_03/Home%20screen/Progress%20screen/progress_screen.dart';
import 'package:flutter_task_03/Home%20screen/Task%20screen/task_screen.dart';
import 'package:flutter_task_03/Home%20screen/home_screen.dart';

class navigator_screen extends StatefulWidget {
  const navigator_screen({super.key});

  @override
  State<navigator_screen> createState() => _navigator_screen();
}

class _navigator_screen extends State<navigator_screen> {
  int _selectedIndex = 0;

  List screens = [
    const home_screen(),
    task_screen(),
    progress_screen(),
    profile_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (currentIndex) {
          setState(() {
            _selectedIndex = currentIndex;
          });
        },
      ),
    );
  }
}
