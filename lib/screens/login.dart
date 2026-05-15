// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/services/storage_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(centerTitle: true, title: Text("Log in")),
            body: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WELCOME TO BITE BACK",
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Enter your phone number or Email address for Log in. Enjoy your food :)",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: const Color.fromARGB(255, 147, 24, 24),
                                ),
                                hintText: "Your Email",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: passwordController,
                              obscureText: _isPasswordObscure,
                              decoration: InputDecoration(
                                suffix: IconButton(
                                  icon: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordObscure = !_isPasswordObscure;
                                    });
                                  },
                                ),
                                icon: Icon(
                                  Icons.lock,
                                  color: const Color.fromARGB(255, 147, 24, 24),
                                  size: 19,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/forgotpassword");
                              },
                              child: Text(
                                "Forgot password? ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            height: 40,
                            width: 400,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15,
                                  ),
                                ),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  147,
                                  24,
                                  24,
                                ),
                              ),
                             onPressed: () async {
  if (EmailController.text.isEmpty ||
      passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter email and password"),
      ),
    );
    return;
  }

  try {
    var response = await ApiService.login(
      EmailController.text.trim(),
      passwordController.text.trim(),
    );

    print("LOGIN RESPONSE: $response");
    print(jsonEncode(response));

    if (response["success"] == true) {

      final data = response["data"];

      if (data["requiresOtp"] == true) {

        if (!context.mounted) return;

        Navigator.pushNamed(
          context,
          "/pin",
          arguments: {
            "userId": data["userId"],
          },
        );

      } else {

        final String token = data["accessToken"] ?? "";
        final String refreshToken = data["refreshToken"] ?? "";

        await StorageService.saveToken(token);
        await StorageService.saveRefreshToken(refreshToken);

        if (!context.mounted) return;

        Navigator.pushNamedAndRemoveUntil(
          context,
          "/homepage",
          (route) => false,
        );
      }

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response["message"] ?? "Invalid email/phone or password",
          ),
        ),
      );

    }

  } catch (e) {

    print("LOGIN ERROR: $e");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Something went wrong: $e"),
      ),
    );

  }
},
                              label: Text(
                                "Login ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
