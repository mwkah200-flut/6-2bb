// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cartdata.dart';

class Itemname extends StatefulWidget {
  final Map item;

  const Itemname({super.key, required this.item});

  @override
  State<Itemname> createState() => _ItemnameState();
}

class _ItemnameState extends State<Itemname> {
  int count1 = 1;
  String? selectedAddon;

  late double mealPrice;

  double get totalPrice => mealPrice * count1;

  @override
  void initState() {
    super.initState();

    mealPrice = (widget.item["price"] ?? 11.99).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      child: Text(
                        widget.item["name"] ?? "Item name",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),

                    Align(
                      alignment: Alignment(0, -0.35),
                      child: Text(
                        widget.item["description"] ?? "Delicious food item",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),

                    Align(
                      alignment: Alignment(0, 1.2),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.item["image"] ??
                                  "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Center(
                child: Container(
                  width: 240,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${mealPrice.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18),
                      ),

                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (count1 > 1) {
                                setState(() => count1--);
                              }
                            },
                          ),
                          Text("$count1"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() => count1++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.item["description"] ??
                      "Fresh and tasty food prepared with high quality ingredients.",
                ),
              ),

              SizedBox(height: 20),

              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Add ons", style: TextStyle(fontSize: 18)),
              ),

              Column(
                children: ["Cheese", "Extra Sauce", "Spicy", "Fries"].map((e) {
                  return RadioListTile<String>(
                    value: e,
                    groupValue: selectedAddon,
                    onChanged: (v) {
                      setState(() => selectedAddon = v);
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
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),

              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 147, 24, 24),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    CartData.items.add(
                      CartItem(
                        name: widget.item["name"] ?? "Item",
                        price: mealPrice,
                        quantity: count1,
                        restaurant: widget.item["restaurant"],
                      ),
                    );

                    Navigator.pushNamed(context, "/yourorders");
                  },
                  child: Text(
                    "Add To Cart (\$${totalPrice.toStringAsFixed(2)})",
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
