// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Resetsent extends StatelessWidget {
  const Resetsent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(centerTitle: true, title: Text("Log in")),
            body: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Reset email sent",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),

                        SizedBox(height: 30),

                        Container(padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "we have sent instructions email to ndsnsjb@nfdslkg.com ",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),

                        Container(
                          
                          child: TextButton(
                            isSemanticButton: false,
                            onPressed: () {},
                            child: Text(
                              "Having a problem",
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
                            onPressed: () {},
                            label: Text(
                              "SEND AGAIN",
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
