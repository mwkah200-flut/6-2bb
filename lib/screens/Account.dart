// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // 👇 كل سويتش ليه state لوحده
  bool pushOn = false;
  bool smsOn = false;
  bool promoOn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 750,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account Settings",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 20),

                      Text(
                        "Update your settings like notification , payments , profile edit etc",
                        style: TextStyle(fontSize: 16),
                      ),

                      SizedBox(height: 20),

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/profileinfo");
                        },
                        child: _row(
                          Icons.person,
                          "Profile information",
                          "Change your account information",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/changepassword");
                        },
                        child: _row(
                          Icons.lock,
                          "Change password",
                          "change your password",
                        ),
                      ),
                      _row(
                        Icons.payment,
                        "Payment methods",
                        "Add your credit & debit",
                      ),
                      _row(
                        Icons.location_on,
                        "Locations",
                        "Add or remove your delivery locations",
                      ),
                      _row(
                        Icons.facebook,
                        "Add social accounts",
                        "Add facebook , twitter , etc",
                      ),
                      _row(
                        Icons.ios_share,
                        "refer to friends",
                        "Get 10 \$ for reffering friends",
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 15),

                      _row2(
                        "Push Notification",
                        "For daily update you will get it",
                        pushOn,
                        (value) {
                          setState(() {
                            pushOn = value;
                          });
                        },
                      ),

                      _row2(
                        "SMS notifications",
                        "For daily update you will get it",
                        smsOn,
                        (value) {
                          setState(() {
                            smsOn = value;
                          });
                        },
                      ),

                      _row2(
                        "Promotional Notification",
                        "For daily update you will get it",
                        promoOn,
                        (value) {
                          setState(() {
                            promoOn = value;
                          });
                        },
                      ),

                      SizedBox(height: 20),

                      Text(
                        "More",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      _row(
                        Icons.star,
                        "Rate us",
                        "Rate us playsore , appstore",
                      ),
                      _row(
                        Icons.menu_book,
                        "FAQ",
                        "Frequently asked questions",
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.logout),
                                  SizedBox(width: 25),
                                  Text("Logout"),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              child: Row(
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
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.food_bank_outlined, size: 30),
                        ),
                        Text("Home", style: TextStyle(fontSize: 15)),
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
                        style: TextStyle(fontSize: 15, color: Colors.black),
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
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Account");
                        },
                        icon: Icon(
                          Icons.person,
                          size: 30,

                          color: const Color.fromARGB(255, 147, 24, 24),
                        ),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 15,

                          color: const Color.fromARGB(255, 147, 24, 24),
                        ),
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

  Widget _row(IconData icon, String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,

                    style: TextStyle(
                      color: const Color.fromARGB(190, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    text2,

                    style: TextStyle(color: const Color.fromARGB(190, 0, 0, 0)),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  Widget _row2(
    String text1,
    String text2,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.notifications),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      color: const Color.fromARGB(190, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    text2,

                    style: TextStyle(color: const Color.fromARGB(190, 0, 0, 0)),
                  ),
                ],
              ),
            ],
          ),
          CupertinoSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
