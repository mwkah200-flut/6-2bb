// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Changepssword extends StatefulWidget {
  @override
  State<Changepssword> createState() => _ChangepsswordState();
}

class _ChangepsswordState extends State<Changepssword> {
  @override
  Widget build(BuildContext context) {
    bool _isPasswordObscure = true;

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "*************",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(height: 030),
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
                          obscureText: _isPasswordObscure,
                          decoration: InputDecoration(
                            suffix: IconButton(
                              icon: Icon(Icons.visibility, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscure = !_isPasswordObscure;
                                });
                              },
                            ),
                           
                            // hintText: "Password",
                            // hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                    ],
                  ),
                
                
                  SizedBox(height: 30),

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
                          obscureText: _isPasswordObscure,
                          decoration: InputDecoration(
                            suffix: IconButton(
                              icon: Icon(Icons.visibility, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscure = !_isPasswordObscure;
                                });
                              },
                            ),
                           
                            // hintText: "Password",
                            // hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                    ],
                  ),
                
                  SizedBox(height: 30),

                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
