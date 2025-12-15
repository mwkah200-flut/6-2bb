// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final TextEditingController myController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(centerTitle: true, title: Text("Log in")),
            body: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(fontSize: 30),
                        ),

                        SizedBox(height: 30),

                        Text(
                          "Enter your Email address and we will send you a reset instructions",
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
                            // color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(66),
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            controller: myController,
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
                    
               
                
                        SizedBox(height: 50),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 400,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                147,
                                24,
                                24,
                              ),
                            ),
                            onPressed: () {

                              
                              
                            Navigator.pushNamed(context, "/Resetsent"
                             
                              );},
                            label: Text(
                              "Reset Password ",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                     
                      ],
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
