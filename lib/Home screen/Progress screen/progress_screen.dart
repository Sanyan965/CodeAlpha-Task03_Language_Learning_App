import 'package:flutter/material.dart';

class progress_screen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<progress_screen> {
  String selectedCourse = 'German Language';
  String selectedPeriod = 'This Week';
  int selectedBarIndex = 3;

  final List<String> courses = [
    'German Language',
    'Spanish Language',
    'French Language'
  ];
  final List<int> progressData = [10, 15, 20, 31, 12, 25, 18];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Progress',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: selectedCourse,
              items: courses.map((course) {
                return DropdownMenuItem(value: course, child: Text(course));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            const Text(
              'Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(selectedPeriod),
            //     IconButton(
            //       icon: Icon(Icons.calendar_today),
            //       onPressed: () {
            //         // Add functionality to select different periods if needed
            //       },
            //     ),
            //   ],
            // ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(progressData.length, (index) {
                bool isSelected = index == selectedBarIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBarIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: progressData[index] *
                            2.0, // Height based on progress value
                        width: 24,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isSelected
                            ? Center(
                                child: Text(
                                  '${progressData[index]}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun'
                        ][index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),

            const Text(
              'Completed Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  TaskItem(
                      title: 'Erater Tag in Berlin',
                      lesson: 'Lesson 1',
                      isCompleted: true),
                  SizedBox(height: 20),
                  TaskItem(
                      title: 'First Steps',
                      lesson: 'Lesson 2',
                      isCompleted: false),
                  SizedBox(height: 20),
                  TaskItem(
                      title: 'Vocabulary',
                      lesson: 'Lesson 3',
                      isCompleted: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String lesson;
  final bool isCompleted;

  TaskItem(
      {required this.title, required this.lesson, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.play_circle_fill, color: Colors.blue),
      title: Text(title),
      subtitle: Text(lesson),
      trailing: isCompleted
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
    );
  }
}
