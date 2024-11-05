import 'package:flutter/material.dart';
import 'package:flutter_task_03/Home%20screen/Question%20no%2001/question_01_screen.dart';
import 'package:get/get.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  void onCourseTap(BuildContext context, String courseName) {
    // Define action when course card is clicked
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(courseName),
        content: const Text("Course details here..."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage("assets/Home screen image/image.jpeg"),
              radius: 20,
              // backgroundColor: Colors.amber,
            ),
            SizedBox(width: 20),
            Text(
              "Hello, Fillo",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What would you like to learn today?",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Continue Course Section
            const SectionTitle(title: "Continue Course"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(question_01_screen());
                    }, //=> onCourseTap(context, 'German Language'),
                    child: const CourseCard(
                      title: "German Language",
                      progress: "15/20",
                      classes: "20 Classes • Easy",
                      progressColor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => onCourseTap(context, 'Spanish Language'),
                    child: const CourseCard(
                      title: "Spanish Language",
                      progress: "10/30",
                      classes: "30 Classes • Easy",
                      progressColor: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SectionTitle(title: "Featured Courses"),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => onCourseTap(context, 'Grammar Quiz'),
              child: const FeaturedCourseCard(
                title: "Grammar Quiz",
                subtitle: "Business English",
                duration: "2 hours",
                icon: Icons.book,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => onCourseTap(context, 'Set Weekly Goal'),
              child: const FeaturedCourseCard(
                title: "Set Weekly Goal!",
                subtitle: "Stay motivated with goals",
                duration: "",
                icon: Icons.flag,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String progress;
  final String classes;
  final Color progressColor;

  const CourseCard({
    super.key,
    required this.title,
    required this.progress,
    required this.classes,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircularProgressIndicator(
            value: double.parse(progress.split('/')[0]) /
                double.parse(progress.split('/')[1]),
            color: progressColor,
            backgroundColor: Colors.grey[200],
            strokeWidth: 8,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(classes, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

// Widget for the "Featured Courses" cards
class FeaturedCourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final IconData icon;

  const FeaturedCourseCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
                if (duration.isNotEmpty)
                  Text(duration, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for section titles
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child:
              const Text("See All", style: TextStyle(color: Colors.deepPurple)),
        ),
      ],
    );
  }
}
