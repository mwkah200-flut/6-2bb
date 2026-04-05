// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Mcdonalds extends StatelessWidget {
  const Mcdonalds({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Mcdonalds")),

        body: Column(
          children: [
            _order(
              "1",
              "cookie Sandwich",
              "shortbread, choclate turtle",
              "cookies and red velvet",
            ),
            Divider(),
            _order(
              "1",
              "Combo burger",
              "shortbread, choclate turtle",
              "cookies and red velvet",
            ),
            Divider(),
            _order(
              "2",
              "Oyster dish",
              "shortbread, choclate turtle",
              "cookies and red velvet",
            ),
            Divider(),
            SizedBox(
              width: 400,
              height: 300,
              // color: Colors.blue,
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(0.0, 1.91),
                    child: Container(
                      width: 397.1,
                      height: 270,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(48, 192, 134, 26),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(0, -1),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 147, 24, 24),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.check, color: Colors.white, size: 50),
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(0.0, -0.17),
                    child: Text(
                      'You placed the order successfully',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  /// Text 2
                  Align(
                    alignment: const Alignment(0, 0.6),
                    child: SizedBox(
                      width: 380,
                      height: 100,
                      child: Text(
                        'You placed the order successfully. youl will get your food within 25 minutes. thanks for using our survices. enjoy your food :)',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(0.0, 1.03),
                    child: TextButton(
                      onPressed: () {

                    Navigator.pushNamed(context, "/homepage");

                      },
                      child: Text(
                        'Keep browsing',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                          color: const Color.fromARGB(255, 147, 24, 24),
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
    );
  }

  Widget _order(
    String num,
    String meal,
    String discription1,
    String discription2,
  ) {
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
                        color: Colors.yellow.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal,
                      style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                    ),
                    Text(
                      discription1,
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    Text(
                      discription2,
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
