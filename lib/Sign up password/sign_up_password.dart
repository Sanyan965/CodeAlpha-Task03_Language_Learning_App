import 'package:flutter/material.dart';
import 'package:flutter_task_03/Login%20screen/login_screen.dart';
import 'package:get/get.dart';

class sign_up_password extends StatefulWidget {
  const sign_up_password({super.key});

  @override
  State<sign_up_password> createState() => _sign_up_passwordState();
}

class _sign_up_passwordState extends State<sign_up_password> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Choose your password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 30),
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
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: TextFormField(
                  obscureText: _isObscured,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Enter your confirm password",
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
              SizedBox(height: 50),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  Get.to(sign_up_password());
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
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Or",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 30),
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
                    "Already you member?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const login_screen());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "Login",
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
