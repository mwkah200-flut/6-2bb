// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 840,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // "شويه الكلام اللي في الاول و الحته الحمراء"
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 2)),
                      width: double.infinity,
                      // color: Colors.blue,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 35, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                SizedBox(height: 10),
                                Text(
                                  "Hello user ... ",
                                  style: TextStyle(fontSize: 25),
                                ),

                                // SizedBox(height: 4,),
                                Text(
                                  "Grab your bite ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Stack(
                              alignment: AlignmentGeometry.topCenter,
                              children: [
                                Image.asset("assets/images/OIP.webp"),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 50, 0, 0),

                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Text(
                      "DELIVERY TO",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 147, 24, 24),
                        fontSize: 15,
                      ),
                    ),

                    //  "الاكسات و فيلتر"
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "XXXXXXXXXX",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(width: 0),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_downward),
                          ),
                          SizedBox(width: 20),

                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50),

                    // السيرش
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      padding: EdgeInsets.fromLTRB(130, 0, 130, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(172, 158, 158, 158),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search bar",
                          hintStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    //  "كاتيجوري و سي اول"
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "see all",
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 147, 24, 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // مربعات الصور
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(172, 158, 158, 158),
                              ),
                              child: Center(
                                child: Text(
                                  "Cat. Pic.",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),

                            SizedBox(width: 30),

                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(172, 158, 158, 158),
                              ),
                              child: Center(
                                child: Text(
                                  "Cat. Pic.",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),

                            SizedBox(width: 30),

                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(172, 158, 158, 158),
                              ),
                              child: Center(
                                child: Text(
                                  "Cat. Pic.",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 50),

                    // "الاحمر و الرصاصي"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Experience our delecious dish",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              Text(
                                "70% off",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          width: 190,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 147, 24, 24),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "OFFER PIC ",
                              style: TextStyle(
                                fontSize: 30,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          width: 190,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color.fromARGB(172, 158, 158, 158),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50),

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recommend",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "see all",
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 147, 24, 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // الاطباق
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            //  اول طبق
                            Container(
                              height: 230,
                              width: 350,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   left: 0,
                                  //   top: 0,
                                  //   child: Container(
                                  //     height: 200,
                                  //     width: 350,
                                  //     color: Colors.blue,
                                  //   ),
                                  // ),
                                  Positioned(
                                    top: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                        
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 30),
                                                child: Text(
                                                  "dish name ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                        
                                              Text(
                                                "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              147,
                                              24,
                                              24,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 160,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              147,
                                              24,
                                              24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                        
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "dish pic ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        
                            SizedBox(width: 10),
                            // تاني طبق
                            Container(
                              height: 230,
                              width: 350,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   left: 0,
                                  //   top: 0,
                                  //   child: Container(
                                  //     height: 200,
                                  //     width: 350,
                                  //     color: Colors.blue,
                                  //   ),
                                  // ),
                                  Positioned(
                                    top: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                        
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 30),
                                                child: Text(
                                                  "dish name ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                        
                                              Text(
                                                "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              147,
                                              24,
                                              24,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 160,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              147,
                                              24,
                                              24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                        
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "dish pic ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        
                            SizedBox(width: 10),
                            //   تالت طبق
                            // متفتحهمش عشان هتتلغبط
                            Container(
                              height: 230,
                              width: 350,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   left: 0,
                                  //   top: 0,
                                  //   child: Container(
                                  //     height: 200,
                                  //     width: 350,
                                  //     color: Colors.blue,
                                  //   ),
                                  // ),
                                  Positioned(
                                    top: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                        
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 30),
                                                child: Text(
                                                  "dish name ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                        
                                              Text(
                                                "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              147,
                                              24,
                                              24,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 160,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              147,
                                              24,
                                              24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                        
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "dish pic ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(100),
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

                    SizedBox(height: 250),
                  ],
                ),
              ),
            ),

            Container(
              height: 74.2,              
              // color: Colors.blue,
              child: 
              Stack(
                children: [
                  
                  // الشله اللي تحت 
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.food_bank_outlined, size: 30),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, size: 30),
                      ),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.receipt_long, size: 30),
                      ),
                      Text(
                        "Orders",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person, size: 30),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
                
                  // Positioned(
                  //   bottom: -50,
                  //   left: -50,
                  //   child: Container(
                  //     height: 100,
                  //     width: 100,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(100),
                  //       color: Color.fromARGB(255, 147, 24, 24),
                  //     ),
                  //   ),
                  // )
                
                
                ],

              )
            ),
          ],
        ),
      ),
    );
  }
}
