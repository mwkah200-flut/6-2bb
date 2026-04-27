// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cartdata.dart';
import 'package:flutter_application_1/screens/resturantname.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({super.key});

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  double get subtotal {
    return CartData.items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double delivery = 0;

  double get total => subtotal + delivery;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Your Orders")),

        body: CartData.items.isEmpty
            ? const Center(child: Text("Cart is empty"))
            : Column(
                children: [
                  /// ITEMS LIST
                  Expanded(
                    child: ListView.builder(
                      itemCount: CartData.items.length,
                      itemBuilder: (context, index) {
                        final item = CartData.items[index];

                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// NAME + QTY
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name.isNotEmpty
                                          ? item.name
                                          : "Unknown Item",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text("Qty: ${item.quantity}"),
                                  ],
                                ),

                                /// PRICE
                                Text(
                                  "${(item.price * item.quantity).toStringAsFixed(2)} EGP",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  InkWell(
                   onTap: () {
  if (CartData.items.isEmpty) return;

  final restaurant = CartData.items.first.restaurant;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ResturantPage(
        restaurant: restaurant,
      ),
    ),
  );
},
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
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Promo code",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),

                  /// SUMMARY
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        row("Subtotal", subtotal),
                        row("Delivery", delivery),
                        const Divider(),
                        row("Total", total, isBold: true),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                147,
                                24,
                                24,
                              ),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Order Placed 🚀"),
                                ),
                                
                              );
                              Navigator.pushNamed(context, "/addcard");
                            },
                            child: const Text(
                              "Checkout",
                              style: TextStyle(color: Colors.white),
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

  Widget row(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "${value.toStringAsFixed(2)} EGP",
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
