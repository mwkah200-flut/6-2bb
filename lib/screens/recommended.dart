// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/resturantname.dart';
import 'package:flutter_application_1/services/api_service.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  List restaurants = [
    {
      "name": "McDonald's",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.8",
    },
    {
      "name": "Pizza Hut",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.5",
    },
    {
      "name": "KFC",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.2",
    },
  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecommended();
  }

  Future<void> getRecommended() async {
    final result = await ApiService.getAllRestaurants();
    print(result);
    if (result["success"] == true) {
      setState(() {
        restaurants = result["data"]["items"] ?? [];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Recommended")),
        backgroundColor: Colors.white,
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.55, 
                      ),
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        final res = restaurants[index];
                        return buildRestaurantCard2(res);
                      },
                    ),
                  ),
                  buildBottomNavBar(),
                ],
              ),
      ),
    );
  }

  Widget buildRestaurantCard() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 185,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),

                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text(
                                    "25 mins",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Free",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 147, 24, 24),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "4.5",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                width: 185,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Resturant name", style: TextStyle(fontSize: 18)),
                    Text("Type", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: () {},
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/resturantname");
                },
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 185,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),

                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text(
                                    "25 mins",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Free",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 147, 24, 24),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "4.5",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                width: 185,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Resturant name", style: TextStyle(fontSize: 18)),
                    Text("Type", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                icon: const Icon(
                  Icons.food_bank_outlined,
                  color: Color.fromARGB(255, 147, 24, 24),
                ),
              ),
              const Text("Home"),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search");
                },
                icon: const Icon(Icons.search),
              ),
              const Text("Search"),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.receipt_long),
              ),
              const Text("Orders"),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Account");
                },
                icon: const Icon(Icons.person),
              ),
              const Text("Profile"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRestaurantCard2(dynamic res) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResturantPage(
              restaurant: {
                "name": "Pizza Place",
                "image":
                    "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",

                "rating": 4.5,
                "reviews": 200,
                "category": "Fast Food",
                "type": "Pizza",
              },
            ),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 185,
              height: 274,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      res["image"] ?? "https://via.placeholder.com/150",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "25 mins",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.white),
                            SizedBox(width: 5),
                            Text("Free", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 147, 24, 24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        res["rate"] ?? "00",

                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: 185,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  res["name"] ?? "Unknown Restaurant",
                  style: TextStyle(fontSize: 18),
                ),
                Text(res["type"] ?? "Food", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
