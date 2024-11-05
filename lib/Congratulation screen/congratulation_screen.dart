import 'package:flutter/material.dart';
import 'package:flutter_task_03/Login%20screen/login_screen.dart';
import 'package:get/get.dart';

class congratulation_screen extends StatelessWidget {
  const congratulation_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.emoji_events,
              size: 400,
              color: Colors.orange,
            ),
            Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Please! Login or Sign up &\nGet Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(login_screen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 170, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
