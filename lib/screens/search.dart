// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.black12,
                height: 700.8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 147, 24, 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recent searches",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              // fontWeight: FontWeight.w700,
                            ),
                          ),

                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 147, 24, 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            const Color.fromARGB(0, 171, 170, 170),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.search, size: 30, color: Colors.grey),

                            Text(
                              "burger",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            const Color.fromARGB(0, 171, 170, 170),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.search, size: 30, color: Colors.grey),

                            Text(
                              "subway",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            const Color.fromARGB(0, 171, 170, 170),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.search, size: 30, color: Colors.grey),

                            Text(
                              "sandwich",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            const Color.fromARGB(0, 171, 170, 170),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.search, size: 30, color: Colors.grey),

                            Text(
                              "pizza",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            const Color.fromARGB(0, 171, 170, 170),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.search, size: 30, color: Colors.grey),

                            Text(
                              "cake",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
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
                                icon: const Icon(Icons.food_bank_outlined, size: 30),
                              ),
                              const Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

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
                                Icons.search,
                                size: 30,
                                color: Color.fromARGB(255, 147, 24, 24),
                              ),
                            ),
                            const Text(
                              "Search",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 147, 24, 24),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.receipt_long, size: 30),
                            ),
                            const Text(
                              "Orders",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {                        Navigator.pushNamed(context, "/Account");
},
                              icon: const Icon(Icons.person, size: 30),
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
