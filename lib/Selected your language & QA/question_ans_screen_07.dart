import 'package:flutter/material.dart';
import 'package:flutter_task_03/Congratulation%20screen/congratulation_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class question_ans_screen_07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            const Text('Completed 7/7', style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Overview',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn listening, speaking, reading and writing in English',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Course Content:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CourseContentCard(
                  icon: Icons.book,
                  count: '9000+',
                  label: 'Words',
                  onTap: () {
                    // Action when "Words" card is clicked
                    print("Words card clicked");
                  },
                ),
                CourseContentCard(
                  icon: Icons.article,
                  count: '2100+',
                  label: 'Sentences',
                  onTap: () {
                    // Action when "Sentences" card is clicked
                    print("Sentences card clicked");
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(congratulation_screen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
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

class CourseContentCard extends StatelessWidget {
  final IconData icon;
  final String count;
  final String label;
  final VoidCallback onTap;

  const CourseContentCard({
    required this.icon,
    required this.count,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
