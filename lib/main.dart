import 'package:flutter/material.dart';
import 'package:flutter_application_1/Account.dart';
import 'package:flutter_application_1/Resetsent.dart';
import 'package:flutter_application_1/Welcome.dart';
import 'package:flutter_application_1/addcard.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/forgotpassword.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/mcdonalds.dart';
import 'package:flutter_application_1/number.dart';
import 'package:flutter_application_1/pin.dart';
import 'package:flutter_application_1/itemname.dart';
import 'package:flutter_application_1/recommended.dart';
import 'package:flutter_application_1/resturantname.dart';
import 'package:flutter_application_1/search.dart';
import 'package:flutter_application_1/yourorders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Welcome(),
        "/login": (context) => const Login(),
        "/forgotpassword": (context) => const Forgotpassword(),
        "/Resetsent": (context) => const Resetsent(),
        "/createAccount": (context) => const Createaccount(),
        "/number": (context) => Number(),
        "/pin": (context) => const Pin(phonenumber: ""),
        "/homepage": (context) => Homepage(),
        "/search": (context) => Search(),
        "/resturantname": (context) => ResturantPage(),
        "/itemname": (context) => Itemname(),
        "/recommended": (context) => Recommended(),
        "/addcard": (context) => AddCard(),
        "/yourorders": (context) => yourorders(),
        "/mcdonalds": (context) => Mcdonalds(),
        "/Account": (context) => Account(),
      },
    );
  }
}
