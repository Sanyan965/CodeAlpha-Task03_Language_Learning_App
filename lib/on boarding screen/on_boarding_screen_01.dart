import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_task_03/Login%20screen/login_screen.dart';
import 'package:flutter_task_03/Selected%20your%20language%20&%20QA/selected_language_screen_01.dart';
import 'package:get/get.dart';

class on_boarding_screen_01 extends StatefulWidget {
  const on_boarding_screen_01({Key? key}) : super(key: key);

  @override
  State<on_boarding_screen_01> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<on_boarding_screen_01> {
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/On boarding 01/image 01.png",
      "title": "Confidence in your words",
      "description":
          "With conversation-based learning, you'll be talking from lesson one."
    },
    {
      "image": "assets/On boarding 01/image 02.png",
      "title": "Take your time to learn",
      "description":
          "Develop a habit of learning and make it a part of your daily routine."
    },
    {
      "image": "assets/On boarding 01/image 03.png",
      "title": "The lessons you need to learn",
      "description": "Using a variety of learning styles to learn and retain."
    },
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _onboardingData.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _onboardingData[_currentIndex]["image"]!,
                height: 350,
                width: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentIndex == index ? 16 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _onboardingData[_currentIndex]["title"]!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _onboardingData[_currentIndex]["description"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(selected_language_screen());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 45),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Choose a language",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a fillolearn user?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => login_screen());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
