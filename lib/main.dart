import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Account.dart';
import 'package:flutter_application_1/screens/Resetsent.dart';
import 'package:flutter_application_1/screens/Welcome.dart';
import 'package:flutter_application_1/screens/addcard.dart';
import 'package:flutter_application_1/screens/changepssword.dart';
import 'package:flutter_application_1/screens/createAccount.dart';
import 'package:flutter_application_1/screens/forgotpassword.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/mcdonalds.dart';
import 'package:flutter_application_1/screens/number.dart';
import 'package:flutter_application_1/screens/pin.dart';
import 'package:flutter_application_1/screens/itemname.dart';
import 'package:flutter_application_1/screens/profileinfo.dart';
import 'package:flutter_application_1/screens/recommended.dart';
import 'package:flutter_application_1/screens/resturantname.dart';
import 'package:flutter_application_1/screens/search.dart';
import 'package:flutter_application_1/screens/yourorders.dart';

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
        "/": (context) => const Welcome(),
        "/login": (context) =>  Login(),
        "/forgotpassword": (context) => const Forgotpassword(),
        "/Resetsent": (context) => const Resetsent(),
        "/createAccount": (context) =>  Createaccount(),
        "/number": (context) => Number(),
        "/pin": (context) =>  const Pin(phonenumber: ""),
        "/homepage": (context) => const Homepage(),
        "/search": (context) => const Search(),
        "/resturantname": (context) => const ResturantPage(),
        "/itemname": (context) => const Itemname(),
        "/recommended": (context) => const Recommended(),
        "/addcard": (context) => const AddCard(),
        "/yourorders": (context) => const yourorders(),
        "/mcdonalds": (context) => const Mcdonalds(),
        "/Account": (context) => const Account(),
        "/profileinfo": (context) => Profileinfo(),
        "/changepassword": (context) => Changepssword(),
      },
    );
  }
}
