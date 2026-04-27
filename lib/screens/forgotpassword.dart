// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/services/storage_service.dart';


class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Forgot Password")),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0), 
          width: double.infinity,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Enter your Email address and we will send you a reset instructions",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: myController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email, 
                          color: const Color.fromARGB(255, 147, 24, 24),
                        ),
                        hintText: "Your Email",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    height: 50, 
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: const Color.fromARGB(255, 147, 24, 24),
                      ),
                      onPressed: () async {
                        String email = myController.text.trim();

                        if (email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please enter your email")),
                          );
                          return;
                        }

                        try {
                          final response = await ApiService.forgotPassword(email);

                          if (response.statusCode == 200) {
                            await StorageService.saveTempEmail(email);

                            if (mounted) {
                              Navigator.pushNamed(context, "/Resetsent");
                            }
                          } else {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error: ${response.body}")),
                              );
                            }
                          }
                        } catch (e) {
                          print("Error connecting to server: $e");
                        }
                      },
                      label: Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
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