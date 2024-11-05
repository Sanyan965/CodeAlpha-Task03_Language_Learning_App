import 'package:flutter/material.dart';
import 'package:flutter_task_03/Selected%20your%20language%20&%20QA/question_ans_screen_06.dart';
import 'package:get/get.dart';

class question_ans_screen_05 extends StatefulWidget {
  const question_ans_screen_05({super.key});

  @override
  State<question_ans_screen_05> createState() => _question_ans_screen_05State();
}

class _question_ans_screen_05State extends State<question_ans_screen_05> {
  int _selectedLanguageIndex = -1;
  final List<Map<String, dynamic>> _Timers = [
    {'name': '5min/day', 'icon': Icons.timelapse_rounded},
    {'name': '15min/day', 'icon': Icons.timelapse_rounded},
    {'name': '30min/day', 'icon': Icons.timelapse_rounded},
    {'name': '60min/day', 'icon': Icons.timelapse_rounded},
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
          'Completed 5/7',
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
              'How much time do you want to\n      learn english?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _Timers.length,
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
                            _Timers[index]['icon'],
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _Timers[index]['name'],
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
                  Get.to(question_ans_screen_06());
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
