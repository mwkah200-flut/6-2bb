// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Itemname extends StatefulWidget {
  const Itemname({super.key});

  @override
  State<Itemname> createState() => _ItemnameState();
}

class _ItemnameState extends State<Itemname> {
  int count1 = 1;
  int count2 = 1;
  String? selectedAddon;

  final double mealPrice = 11.99; // سعر الوجبة

  double get totalPrice => mealPrice * count1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 147, 24, 24),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(140),
                            bottomRight: Radius.circular(140),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.6),
                      child: Text("Item name", style: TextStyle(fontSize: 25)),
                    ),
                    Align(
                      alignment: Alignment(0, -0.35),
                      child: Text(
                        "xxxxxxxxxxxxxxxxxxx",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1.2),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
                            ),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              /// PRICE + COUNTER
              Center(
                child: Container(
                  width: 220,
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsetsGeometry.only( left: 15),
                        child: Text(
                          "\$${mealPrice.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (count1 > 1) {
                                setState(() {
                                  count1--;
                                });
                              }
                            },
                          ),
                          Text("$count1"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                count1++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              /// DESCRIPTION
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("xxxxxxxxxxxxxxxxxxxxxx"),
              ),

              SizedBox(height: 20),

              /// ADDONS
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add ons", style: TextStyle(fontSize: 18)),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Optional"),
                    ),
                  ],
                ),
              ),

              Column(
                children: ["xxxxxxxxx", "xxxxxxx", "xxxxxx", "xxxxxx"].map((e) {
                  return RadioListTile<String>(
                    value: e,
                    groupValue: selectedAddon,
                    onChanged: (v) {
                      setState(() {
                        selectedAddon = v;
                      });
                    },
                    title: Text(e),
                  );
                }).toList(),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Add special instructions",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: 220,
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (count2 > 1) {
                                setState(() {
                                  count2--;
                                });
                              }
                            },
                          ),
                          Text("$count2"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                count2++;
                              });
                            },
                          ),
                        ],
                      ),
                    
                ),
              ),

              /// ADD TO ORDER BUTTON
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 147, 24, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/addtoorder");
                  },
                  child: Text(
                    "Add TO ORDER (\$${totalPrice.toStringAsFixed(2)})",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
