import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task_03/on%20boarding%20screen/on_boarding_screen_01.dart';
import 'package:get/get.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.to(on_boarding_screen_01());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 138, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash/image_1.png",
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Language App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
