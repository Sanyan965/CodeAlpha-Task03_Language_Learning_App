import 'package:flutter/material.dart';
import 'package:flutter_task_03/Selected%20your%20language%20&%20QA/question_ans_screen_05.dart';
import 'package:get/get.dart';

class question_ans_screen_04 extends StatefulWidget {
  const question_ans_screen_04({super.key});

  @override
  State<question_ans_screen_04> createState() => _question_ans_screen_04State();
}

class _question_ans_screen_04State extends State<question_ans_screen_04> {
  int _selectedLanguageIndex = -1;
  final List<String> _ageRanges = [
    'Under 18',
    '18 - 24',
    '25 - 34',
    '35 - 44',
    '45 - 54',
    '55 - 64',
    '65 or older',
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
          'Completed 4/7',
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
              'How old are you?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _ageRanges.length,
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
                          // Icon(
                          //   _age[index]['icon'],
                          // ),
                          const SizedBox(width: 10),
                          Text(
                            _ageRanges[index],
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
                  Get.to(question_ans_screen_05());
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
