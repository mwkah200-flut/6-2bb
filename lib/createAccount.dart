// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Createaccount extends StatelessWidget {
  const Createaccount({Key? key}) : super(key: key);

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
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(fontSize: 30),
                        ),

                        SizedBox(height: 30),

                        Text(
                          "Enter your name , Email And password for Sign up.",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      
                        Container(
                          
                          child: TextButton(
                            isSemanticButton: false,
                            onPressed: () {Navigator.pushNamed(context, "/login");},
                            child: Text(
                              "Already have an account?",
                              style: TextStyle(
                                
                                fontSize: 15,
                                color: const Color.fromARGB(255, 147, 24, 24),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
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
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: const Color.fromARGB(255, 147, 24, 24),
                              ),
                              hintText: "Full name ",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),SizedBox(height: 10),
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
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
                            // color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(66),
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              suffix: Icon(
                                Icons.visibility,
                                color: Colors.grey,
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
                            onPressed: () {},
                            label: Text(
                              "Sign up ",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                         Text(
                          "By signing up you agree to our terms , conditions & privacy policy",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      
                        SizedBox(height: 10),
                            
        
                        Center(
                          child: Text("Or", style: TextStyle(fontSize: 20)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                              backgroundColor: const Color(0xFF3B5998),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(width: 30),
                                Text(
                                  "Connect with facebook",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                              backgroundColor: const Color(0xFF4285F4),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  height: 28,
                                  width: 28,

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: 
                                  SvgPicture.asset(
                                    "assets/images/google-color-svgrepo-com.svg",
                                    
                                  ),
                                ),
                                SizedBox(width: 30),
                                Text(
                                  "Connect with Google",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    )));
  }
}
