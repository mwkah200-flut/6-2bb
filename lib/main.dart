import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resetsent.dart';
import 'package:flutter_application_1/Welcome.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/forgotpassword.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/number.dart';
import 'package:flutter_application_1/pin.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: "/" ,
      routes: {
        "/" : (context) => const Welcome(),
        "/login" : (context) => const Login(),
        "/forgotpassword": (context) => const Forgotpassword(),
        "/Resetsent": (context) => const Resetsent(),
        "/createAccount": (context) => const Createaccount(),
        "/number": (context) =>  Number(),
        "/pin": (context) => const Pin(phonenumber: "",),
        "/homepage": (context) =>  Homepage(),






       
      },
    );
  }
}