// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddToOrderState();
}

class _AddToOrderState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add your payment method",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "this card will only be charged when ",
              style: TextStyle(color: Colors.grey),
            ),
            Text("you place in order", style: TextStyle(color: Colors.grey)),

            SizedBox(height: 40),
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: const Color.fromARGB(135, 193, 192, 192),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(181, 158, 158, 158),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 50,
                    width: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.white,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/credit-card-credit-svgrepo-com.svg",
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 240,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "4343 4343 4343 4343",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(135, 193, 192, 192),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(181, 158, 158, 158),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "MM/YY",
                        ),
                      ),
                    ),

                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(135, 193, 192, 192),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(181, 158, 158, 158),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "CVC",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 400),

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                    backgroundColor: const Color.fromARGB(255, 147, 24, 24),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/mcdonalds");
                  },
                  label: Text(
                    "Add card",
                    style: TextStyle(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: 
                
                Border.all(width: 1, color: const Color.fromARGB(166, 145, 144, 144))),

                // padding: EdgeInsets.only(right: 10),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/credit-card-credit-svgrepo-com.svg",
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Scan card",
                        style: TextStyle(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
