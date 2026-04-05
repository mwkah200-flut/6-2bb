// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false),
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          width: double.infinity,
          child: Center(
            // heightFactor: 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/OIP.jpeg"),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Container(
                      child: const Text(
                        "Last Chance for the best bite",

                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      margin: const EdgeInsets.only(top: 30),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 70),
                  width: double.infinity,
                  height: 450,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 147, 24, 24),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150),
                      topRight: Radius.circular(150),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                186,
                                185,
                                185,
                              ),
                            ),
                            onPressed: () {Navigator.pushNamed(context, "/createAccount");},
                            label: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),

                        SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15),
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                186,
                                185,
                                185,
                              ),
                            ),
                            onPressed: () { Navigator.pushNamed(context, "/login");},
                            label: const Text(
                              "LOG IN",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.black,
      ),
    );
  }
}
