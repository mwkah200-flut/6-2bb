// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pin.dart';
import 'package:flutter_svg/svg.dart';

class Number extends StatelessWidget {

  
   Number({Key? key}) : super(key: key);
  
  final TextEditingController phoneController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
  

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(centerTitle: true, title: Text("Sign up")),
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
                          "Get started with a bite",
                          style: TextStyle(fontSize: 30),
                        ),

                        SizedBox(height: 30),

                        Text(
                          "Enter your number to use foodly and enjoy your food :) ",
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
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            decoration: InputDecoration(
                              prefixText:"+20",
                              prefixStyle: TextStyle(color: Colors.black , fontSize: 18),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  print('SVG clicked');
                                },
                                icon: SvgPicture.asset(
                                  "assets/images/flag-for-egypt.svg",
                                  height: 30,
                                  width: 40,
                                ),
                              ),
                              hintText: "Phone number ",
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
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>Pin(phonenumber: phoneController.text,)));
                            },
                            label: Text(
                              "Sign UP ",
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
