// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/itemname.dart';

class ResturantPage extends StatefulWidget {
  final Map restaurant;

  const ResturantPage({super.key, required this.restaurant});

  @override
  State<ResturantPage> createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  Map restaurant = {};

  @override
  void initState() {
    super.initState();
    restaurant = widget.restaurant;
  }

  /// 👇 Fake items (replace later with API)
  final List<Map<String, dynamic>> items = [
    {
      "name": "Burger",
      "price": 120,
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "desc": "Juicy burger with cheese",
    },
    {
      "name": "Pizza",
      "price": 200,
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "desc": "Cheesy pizza",
    },
    {
      "name": "Chicken",
      "price": 150,
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "desc": "Crispy fried chicken",
    },
  ];

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
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          restaurant["image"] ??
                              "https://via.placeholder.com/300",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              /// NAME
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  restaurant["name"] ?? "No Name",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              /// INFO
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    const Text("\$\$", style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 20),
                    Text(restaurant["category"] ?? "Category"),
                    const SizedBox(width: 20),
                    Text(restaurant["type"] ?? "Type"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// FEATURED ITEMS
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Featured Items",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              /// HORIZONTAL ITEMS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items.map((item) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Itemname(
                              item: {
                                ...item,
                                "restaurant": restaurant, // 👈 أهم سطر
                              },
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item["image"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(item["name"] ?? "No name"),
                            Text("${item["price"] ?? 0} EGP"),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              /// MOST POPULAR
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Most Popular",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              /// LIST ITEMS
              Column(
                children: items.map((item) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Itemname(
                            item: {
                              ...item,
                              "restaurant": restaurant, // 👈 أهم سطر
                            },
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(item["image"]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["name"]),
                                Text(item["desc"]),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${item["price"]} EGP",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
