import 'package:flutter/material.dart';
import 'package:flutter_task_03/Selected%20your%20language%20&%20QA/question_ans_screen_03.dart';
import 'package:get/get.dart';

class question_ans_screen_02 extends StatefulWidget {
  const question_ans_screen_02({super.key});

  @override
  State<question_ans_screen_02> createState() => _question_ans_screen_02State();
}

class _question_ans_screen_02State extends State<question_ans_screen_02> {
  int _selectedLanguageIndex = -1;
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Travel', 'icon': Icons.flight_takeoff},
    {'name': 'Skill Improvement', 'icon': Icons.school},
    {'name': 'Health & Wellness', 'icon': Icons.health_and_safety},
    {'name': 'Personal Finance', 'icon': Icons.attach_money},
    {'name': 'Programming', 'icon': Icons.code},
    {'name': 'Language Learning', 'icon': Icons.language},
    {'name': 'Photography', 'icon': Icons.camera_alt},
    {'name': 'Cooking', 'icon': Icons.restaurant},
    {'name': 'Family/Friends', 'icon': Icons.family_restroom_outlined},
    {'name': 'Work', 'icon': Icons.work_rounded},
  ];

  void _onLanguageSelected(int index) {
    setState(() {
      _selectedLanguageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Completed 2/7',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'What Is The Main Reason To Learn\n            English?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedLanguageIndex == index;
                  return GestureDetector(
                    onTap: () => _onLanguageSelected(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _categories[index]['icon'],
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _categories[index]['name']!,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 170, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Get.to(question_ans_screen_03());
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
