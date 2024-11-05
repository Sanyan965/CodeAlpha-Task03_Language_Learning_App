import 'package:flutter/material.dart';
import 'package:flutter_task_03/Selected%20your%20language%20&%20QA/question_ans_screen_02.dart';
import 'package:get/get.dart';

class selected_language_screen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<selected_language_screen> {
  int _selectedLanguageIndex = -1;

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'flag': '🇺🇸'},
    {'name': 'French', 'flag': '🇫🇷'},
    {'name': 'German', 'flag': '🇩🇪'},
    {'name': 'Hindi', 'flag': '🇮🇳'},
    {'name': 'Korean', 'flag': '🇰🇷'},
    {'name': 'Bengali', 'flag': '🇧🇩'},
    {'name': 'Italian', 'flag': '🇮🇹'},
    {'name': 'Spanish', 'flag': '🇪🇸'},
    {'name': 'Chinese', 'flag': '🇨🇳'},
    {'name': 'Japanese', 'flag': '🇯🇵'},
    {'name': 'Russian', 'flag': '🇷🇺'},
    {'name': 'Portuguese', 'flag': '🇵🇹'},
    {'name': 'Arabic', 'flag': '🇸🇦'},
    {'name': 'Dutch', 'flag': '🇳🇱'},
    {'name': 'Greek', 'flag': '🇬🇷'},
    {'name': 'Turkish', 'flag': '🇹🇷'},
    {'name': 'Swedish', 'flag': '🇸🇪'},
    {'name': 'Norwegian', 'flag': '🇳🇴'},
    {'name': 'Danish', 'flag': '🇩🇰'},
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
          'Completed 1/7',
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
              'What Is Your Mother Language?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
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
                          Text(
                            _languages[index]['flag']!,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _languages[index]['name']!,
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
                  Get.to(question_ans_screen_02());
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
