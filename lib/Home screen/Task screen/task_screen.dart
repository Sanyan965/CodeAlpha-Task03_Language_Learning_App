import 'package:flutter/material.dart';

class task_screen extends StatefulWidget {
  @override
  _task_screen createState() => _task_screen();
}

class _task_screen extends State<task_screen> {
  String selectedDate = "Tue, 19"; // Default selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Task',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DateBox(
                    day: 'Sat',
                    date: '17',
                    isSelected: selectedDate == 'Sat, 17',
                    onDateSelected: () => updateSelectedDate('Sat, 17')),
                DateBox(
                    day: 'Sun',
                    date: '18',
                    isSelected: selectedDate == 'Sun, 18',
                    onDateSelected: () => updateSelectedDate('Sun, 18')),
                DateBox(
                    day: 'Mon',
                    date: '19',
                    isSelected: selectedDate == 'Mon, 19',
                    onDateSelected: () => updateSelectedDate('Mon, 19')),
                DateBox(
                    day: 'Tue',
                    date: '19',
                    isSelected: selectedDate == 'Tue, 19',
                    onDateSelected: () => updateSelectedDate('Tue, 19')),
                DateBox(
                    day: 'Wed',
                    date: '20',
                    isSelected: selectedDate == 'Wed, 20',
                    onDateSelected: () => updateSelectedDate('Wed, 20')),
                DateBox(
                    day: 'Thu',
                    date: '21',
                    isSelected: selectedDate == 'Thu, 21',
                    onDateSelected: () => updateSelectedDate('Thu, 21')),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TaskCard(
                  time: '09:00',
                  language: 'German Language',
                  remainingTasks: 5,
                  color: Colors.greenAccent,
                  flagEmoji: '🇩🇪',
                  onTap: () => showTaskDetails(context, 'German Language'),
                ),
                TaskCard(
                  time: '11:00',
                  language: 'Spanish Language',
                  remainingTasks: 20,
                  color: Colors.orangeAccent,
                  flagEmoji: '🇪🇸',
                  onTap: () => showTaskDetails(context, 'Spanish Language'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateSelectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void showTaskDetails(BuildContext context, String language) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$language Task Details'),
        content: Text('More details about $language tasks Coming Soon...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final VoidCallback onDateSelected;

  DateBox(
      {required this.day,
      required this.date,
      this.isSelected = false,
      required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDateSelected,
      child: Column(
        children: [
          Text(day),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String time;
  final String language;
  final int remainingTasks;
  final Color color;
  final String flagEmoji;
  final VoidCallback onTap;

  TaskCard({
    required this.time,
    required this.language,
    required this.remainingTasks,
    required this.color,
    required this.flagEmoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(flagEmoji, style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          language,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Remaining $remainingTasks Task(s)',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
