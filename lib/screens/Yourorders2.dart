// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cartdata.dart';
import 'package:flutter_application_1/screens/payment.dart';
import 'package:flutter_application_1/screens/resturantname.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class YourOrders2 extends StatefulWidget {
  const YourOrders2({super.key});

  @override
  State<YourOrders2> createState() => _YourOrders2State();
}

class _YourOrders2State extends State<YourOrders2> {
  double get subtotal {
    return CartData.items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double delivery = 0;

  double get total => subtotal + delivery;

  Future<void> addPaymentMethod(PaymentMethod method) async {
    final url = Uri.parse('https://your-domain.com/api/v1/payment-methods');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(method.toJson()),
      );

      if (response.statusCode == 201) {
        print('تمت الإضافة بنجاح: ${response.body}');
      } else {
        print('فشل الطلب بكود: ${response.statusCode}');
        print('الرسالة: ${response.body}');
      }
    } catch (e) {
      print('حدث خطأ أثناء الاتصال: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Your Orders")),

        body: CartData.items.isEmpty
            ? const Center(child: Text("Cart is empty"))
            : Column(
                children: [
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
                          builder: (context) =>
                              ResturantPage(restaurant: restaurant),
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
