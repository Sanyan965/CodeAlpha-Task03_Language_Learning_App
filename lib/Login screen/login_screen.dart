import 'package:flutter/material.dart';
import 'package:flutter_task_03/Navigator_screen/navigator_screen.dart';
import 'package:flutter_task_03/Sign%20up%20screen/sign_up_screen.dart';
import 'package:get/get.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 5,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/login_page/image 01.png",
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              const Text(
                "For free, join now and\n      start learning",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: TextFormField(
                  obscureText: _isObscured,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: Icon(_isObscured
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Pasword",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.to(navigator_screen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Or",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata),
                label: const Text("Continue With Google"),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 50),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook_rounded),
                label: const Text("Continue With Facebook"),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 50),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not you member?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(sign_up_screen());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "Sign Up",
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
