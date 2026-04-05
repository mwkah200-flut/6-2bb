// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo({super.key});

  @override
  State<Profileinfo> createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  final codeController = TextEditingController();
  bool isLoading = false; // تعريف متغير التحميل

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FULL NAME",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "XXXXXXXXXXXXX",
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
                        "EMAIL ADRESS",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "XXXXXXXXXXXXXXXXXXXXXXXX",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(height: 30),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PHONE NUMBER",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "XXXXXXXXXX",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Divider(),
                    ],
                  ),

                  SizedBox(height: 30),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PASSWORD",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "*************",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {

                                Navigator.pushNamed(context, "/changepassword");

                            },
                            child: Text(
                              "Change",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 147, 24, 24),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 60,),

                      Container(
                    padding: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 400,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                        backgroundColor: const Color.fromARGB(255, 147, 24, 24),
                      ),
                      onPressed: () {},

                      label: Text(
                        "Change Password" ,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                
                    ],
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
