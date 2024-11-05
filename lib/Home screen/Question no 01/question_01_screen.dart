import 'package:flutter/material.dart';
import 'package:flutter_task_03/Home%20screen/Lesson%20complete/lesson_complete_screen.dart';
import 'package:get/get.dart';

class question_01_screen extends StatefulWidget {
  @override
  _question_01_screen createState() => _question_01_screen();
}

class _question_01_screen extends State<question_01_screen> {
  int selectedOptionIndex = -1;
  bool isAnswered = false;
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: 0.5, // Change this value to indicate progress
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
            SizedBox(width: 10),
            Text("16/20", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.volume_up, color: Colors.black),
                SizedBox(width: 8),
                Text("jongen",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Text("Select the correct image",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (!isAnswered) {
                        setState(() {
                          selectedOptionIndex = index;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedOptionIndex == index
                            ? Colors.green[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedOptionIndex == index
                              ? Colors.green
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _getIconForOption(index),
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            _getLabelForOption(index),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            isAnswered
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCorrect ? Colors.blue : Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      if (isCorrect) {
                        // Go to the next question
                      } else {
                        setState(() {
                          isAnswered = false;
                          selectedOptionIndex = -1;
                        });
                      }
                    },
                    child: Text(
                      isCorrect ? "Correct Answer!" : "Wrong Answer!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      if (selectedOptionIndex != -1) {
                        setState(
                          () {
                            isAnswered = true;

                            isCorrect = selectedOptionIndex ==
                                2; // Assume correct answer is option 2
                          },
                        );
                        if (isCorrect) {
                          Get.to(lesson_complete_screen());
                        }
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForOption(int index) {
    switch (index) {
      case 0:
        return Icons.man;
      case 1:
        return Icons.woman;
      case 2:
        return Icons.boy;
      case 3:
        return Icons.girl;
      default:
        return Icons.help;
    }
  }

  String _getLabelForOption(int index) {
    switch (index) {
      case 0:
        return "Men";
      case 1:
        return "Women";
      case 2:
        return "Boy";
      case 3:
        return "Girl";
      default:
        return "";
    }
  }
}
