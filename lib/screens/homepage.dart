// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/resturantname.dart';
import 'package:flutter_application_1/services/api_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List restaurants = [
    {
      "name": "McDonald's",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.8",
      "id": "1",
    },
  ];
  List categories = [
    {"name": "Pizza"},
    {"name": "Burger"},
    {"name": "Sushi"},
  ];
  List recommended = [
    {
      "name": "McDonald's",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.8",
      "about": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      "name": "Pizza Hut",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.5",
      "about": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    },
    {
      "name": "KFC",
      "image":
          "https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg",
      "rate": "4.2",
      "about": "Lorem ipsum dolor sit amet",
    },
  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
    fetchCategories();
    fetchRecommended();
  }

  Future<void> fetchRestaurants() async {
    final result = await ApiService.getAllRestaurants();

    print("FULL RESULT: $result");

    if (result["success"] == true) {
      var data = result["data"];

      if (data is List && data.isNotEmpty) {
        setState(() {
          restaurants = data;
        });
      } else if (data is Map &&
          data["items"] != null &&
          data["items"].isNotEmpty) {
        setState(() {
          restaurants = data["items"];
        });
      } else {
        print("⚠️ No restaurants from API, using dummy data");
      }
    } else {
      print("❌ API Error: ${result["message"]}");
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> fetchCategories() async {
  final result = await ApiService.getCategories();

  print("CATEGORIES RAW: $result");

  if (result["success"] == true) {
    var data = result["data"];

    if (data is List && data.isNotEmpty) {
      setState(() {
        categories = data;
      });
    } 
    else if (data is Map &&
        data["items"] != null &&
        data["items"].isNotEmpty) {
      setState(() {
        categories = data["items"];
      });
    } 
    else if (data is Map &&
        data["data"] != null &&
        data["data"].isNotEmpty) {
      setState(() {
        categories = data["data"];
      });
    } 
    else {
      print("⚠️ No categories from API, using dummy data");
    }
  } else {
    print("❌ Categories Error: ${result["message"]}");
  }
}
  Future<void> fetchRecommended() async {
    final result = await ApiService.getRecommendedRestaurants(limit: 10);

    if (result["success"] == true) {
      var data = result["data"];

      if (data != null && data.isNotEmpty) {
        setState(() {
          recommended = data;
        });
      } else {
        print("⚠️ No recommended → using dummy");
      }
    } else {
      print("❌ Recommended Error: ${result["message"]}");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 770,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 35, 0, 0),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  SizedBox(height: 10),
                                  Text(
                                    "Hello user ... ",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    "Grab your bite ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image.asset("assets/images/OIP.webp"),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    50,
                                    0,
                                    0,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/resturantname",
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.notifications,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const Text(
                        "DELIVERY TO",
                        style: TextStyle(
                          color: Color.fromARGB(255, 147, 24, 24),
                          fontSize: 15,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "XXXXXXXXXX",
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_downward),
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Filter",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),

                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        padding: const EdgeInsets.fromLTRB(130, 0, 130, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(172, 158, 158, 158),
                        ),
                        child: const TextField(
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

                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "see all",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 147, 24, 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: categories.map((category) {
                                    return Row(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: const Color.fromARGB(
                                              172,
                                              158,
                                              158,
                                              158,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              category["name"] ?? "Cat. Pic.",
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 30),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                      ),
                      const SizedBox(height: 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: const Text(
                                    "Experience our delecious dish",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                const Text(
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
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: Color.fromARGB(255, 147, 24, 24),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text(
                                "OFFER PIC ",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                            width: 190,
                            height: 150,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color.fromARGB(172, 158, 158, 158),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Recommend",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/recommended");
                              },
                              child: const Text(
                                "see all",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 147, 24, 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: recommended.asMap().entries.map((
                                  entry,
                                ) {
                                  var restaurant = entry.value;
                                  return InkWell(
                                    onTap: () {
                                      final res = restaurant;

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResturantPage(restaurant: res),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      height: 230,
                                      width: 350,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 50,
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
                                                  width: 250,
                                                  height: 150,
                                                  decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                    color: Color.fromARGB(
                                                      255,
                                                      147,
                                                      24,
                                                      24,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          8.0,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          restaurant["name"] ??
                                                              "No Name",
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 24,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                        Text(
                                                          restaurant["about"] ??
                                                              "No description available",
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                        Text(
                                                          "⭐ ${restaurant["rate"] ?? 0}",
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 50,
                                                  height: 150,
                                                  decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                10,
                                                              ),
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
                                              width: 130,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: restaurant["image"] != null
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            100,
                                                          ),
                                                      child: Image.network(
                                                        restaurant["image"],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : const Center(
                                                      child: Text("No Image"),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),

                      const SizedBox(height: 250),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
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
                        onPressed: () {
                          Navigator.pushNamed(context, "/Yourorders2");
                        },
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
            ],
          ),
        ),
      ),
    );
  }
}
