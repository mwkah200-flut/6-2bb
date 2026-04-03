// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Pin extends StatelessWidget {

   final String phonenumber;
   const Pin({super.key, required this.phonenumber});
   
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(centerTitle: true, title: Text("PiN")),
          body: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Verify phone number",
                        style: TextStyle(fontSize: 30),
                      ),
    
                      SizedBox(height: 30),
    
                      Text(
                        "Enter the 4-digit code sent to you at $phonenumber",
                        style: TextStyle(fontSize: 15, color: Colors.grey ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: Column(
                    children: [
                      Container(
                   
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: PinCodeTextField(appContext: context, length: 4)
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
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Homepage()),); 
                          },
                          label: Text(
                            "Continue ",
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
      );
    
  }
}
