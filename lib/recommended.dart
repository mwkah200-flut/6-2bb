// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Recommended extends StatelessWidget {
  Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    int count1 = 1;
    int count2 = 1;
    String? selectedAddon;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Recommended")),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // العمود اللي بيحتوي كل حاجة
            Container(
              height: 710,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // row zarayer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "25 mins",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                        InkWell(
                          onTap: () {
                            // هنا تحط اللي انت عايزه يحصل
                            // Navigator.push(...)
                            // print("clicked");
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
                                      "https://cdn.pixabay.com/photo/2022/08/31/10/17/burger-7422970_1280.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                      
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "25 mins",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 185,
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant name",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Type", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          width: 185,
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant name",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Type", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    ),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // هنا تحط اللي انت عايزه يحصل
                            // Navigator.push(...)
                            // print("clicked");
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
                                      "https://cdn.pixabay.com/photo/2022/08/31/10/17/burger-7422970_1280.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                      
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "25 mins",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                        InkWell(
                          onTap: () {
                            // هنا تحط اللي انت عايزه يحصل
                            // Navigator.push(...)
                            // print("clicked");
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
                                      "https://cdn.pixabay.com/photo/2022/08/31/10/17/burger-7422970_1280.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                      
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "25 mins",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 185,
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant name",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Type", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          width: 185,
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant name",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Type", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    ),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // هنا تحط اللي انت عايزه يحصل
                            // Navigator.push(...)
                            // print("clicked");
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
                                      "https://cdn.pixabay.com/photo/2022/08/31/10/17/burger-7422970_1280.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                      
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "25 mins",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                        InkWell(
                          onTap: () {
                            // هنا تحط اللي انت عايزه يحصل
                            // Navigator.push(...)
                            // print("clicked");
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
                                      "https://cdn.pixabay.com/photo/2022/08/31/10/17/burger-7422970_1280.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                      
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "25 mins",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 185,
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant name",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Type", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          width: 185,
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant name",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Type", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        
            SizedBox(
                // height: 74.2,
                // color: Colors.blue,
                child: Stack(
                  children: [
                    // الشله اللي تحت
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          // padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homepage(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.food_bank_outlined, size: 30),
                              ),
                              Text(
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
                                Navigator.pushNamed(context, "/search");
                              },
                              icon: Icon(Icons.search, size: 30),
                            ),
                            Text(
                              "Search",
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
                              onPressed: () {},
                              icon: Icon(Icons.receipt_long, size: 30),
                            ),
                            Text(
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
                              onPressed: () {},
                              icon: Icon(Icons.person, size: 30),
                            ),
                            Text(
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
    );
  }
}
