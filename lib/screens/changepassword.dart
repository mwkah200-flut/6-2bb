// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart'; // تأكد من المسار

class Changepssword extends StatefulWidget {
  const Changepssword({super.key});

  @override
  State<Changepssword> createState() => _ChangepsswordState();
}

class _ChangepsswordState extends State<Changepssword> {
  // 1. تعريف الـ Controllers
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isNewPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Profile Settings")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  // Current Password Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Password",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: currentPasswordController,
                        decoration: InputDecoration(
                          hintText: "Enter current password",
                          border: InputBorder.none,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(height: 30),
                  // New Password Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Password",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: double.infinity,
                        child: TextField(
                          controller: newPasswordController,
                          obscureText: isNewPasswordObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                isNewPasswordObscure ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isNewPasswordObscure = !isNewPasswordObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Confirm Password Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: double.infinity,
                        child: TextField(
                          controller: confirmPasswordController,
                          obscureText: isConfirmPasswordObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                isConfirmPasswordObscure ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordObscure = !isConfirmPasswordObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Button Section
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: const Color.fromARGB(255, 147, 24, 24),
                      ),
                      onPressed: isLoading ? null : () async {
                        // 1. التأكد من تطابق الباسورد الجديد
                        if (newPasswordController.text != confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords do not match!")),
                          );
                          return;
                        }

                        setState(() => isLoading = true);

                        // 2. مناداة الـ API
                        var response = await ApiService.changePassword(
                          currentPasswordController.text,
                          newPasswordController.text,
                        );

                        setState(() => isLoading = false);

                        if (response["success"] == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Password changed successfully!") ,backgroundColor: Colors.green,),
                          );
                          Navigator.pop(context); 
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(response["message"] ?? "Error occurred"), backgroundColor: Colors.red,),
                          );
                        }
                      },
                      child: isLoading 
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Change Password",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}