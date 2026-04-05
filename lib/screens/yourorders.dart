// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class yourorders extends StatelessWidget {
  const yourorders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Your Orders")),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _order("1"),
            Divider(),
            _order("1"),
            Divider(),
            _order("2"),
            Divider(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Text(
                    "XXXEGP",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "delivery",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Text(
                    "0EGP",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              alignment: Alignment.centerRight,
              child: Text(
                "XXXEGP",
                style: TextStyle(
                  fontSize: 22,
                  color: const Color.fromARGB(255, 147, 24, 24),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add more items",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 147, 24, 24),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),

            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Promo code",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 30),
            SizedBox(
              height: 40,
              width: 400,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  backgroundColor: const Color.fromARGB(255, 147, 24, 24),
                ),
                onPressed: () {

                    Navigator.pushNamed(context, "/addcard");

                },
                label: Text(
                  "CONTINUE (AUD 30)",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _order(String num) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(116, 0, 0, 0),
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: Text(
                      num,
                      style: TextStyle(
                        fontSize: 22,
                        color: const Color.fromARGB(255, 147, 24, 24),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item",
                      style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                    ),
                    Text(
                      "xxxxxxxxxx",
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    Text(
                      "xxxxxxxxxxxxxxxx",
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "XXXEGP",
              style: TextStyle(
                fontSize: 22,
                color: const Color.fromARGB(255, 147, 24, 24),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
