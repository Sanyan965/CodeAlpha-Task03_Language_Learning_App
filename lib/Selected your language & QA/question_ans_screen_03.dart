import 'package:flutter/material.dart';
import 'package:flutter_task_03/Selected%20your%20language%20&%20QA/question_ans_screen_04.dart';
import 'package:get/get.dart';

class question_ans_screen_03 extends StatefulWidget {
  const question_ans_screen_03({super.key});

  @override
  State<question_ans_screen_03> createState() => _question_ans_screen_03State();
}

class _question_ans_screen_03State extends State<question_ans_screen_03> {
  int _selectedLanguageIndex = -1;
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Easy', 'icon': Icons.sentiment_satisfied_alt},
    {'name': 'Medium', 'icon': Icons.sentiment_neutral},
    {'name': 'Expert', 'icon': Icons.sentiment_very_dissatisfied},
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
          'Completed 3/7',
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
              'How Much you Know about English?',
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
                  Get.to(question_ans_screen_04());
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
