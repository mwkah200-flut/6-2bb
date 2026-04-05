// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final EmailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _isPasswordObscure = true;

  void login() async {
    var response = await ApiService.login(
      EmailController.text,
      passwordController.text,
    );

    if (response["success"] == true) {
      var data = response["data"];

      String accessToken = data["accessToken"];
      String refreshToken = data["refreshToken"];

      print("ACCESS TOKEN: $accessToken");
    } else {
      print(response["error"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(centerTitle: true, title: Text("Log in")),
            body: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WELCOME TO BITE BACK",
                            style: TextStyle(fontSize: 30),
                          ),

                          SizedBox(height: 30),

                          Text(
                            "Enter your phone number or Email address for Log in. Enjoy your food :)",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: const Color.fromARGB(255, 147, 24, 24),
                                ),
                                hintText: "Your Email",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: passwordController,

                              obscureText: _isPasswordObscure,
                              decoration: InputDecoration(
                                suffix: IconButton(
                                  icon: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordObscure = !_isPasswordObscure;
                                    });
                                  },
                                ),
                                icon: Icon(
                                  Icons.lock,
                                  color: const Color.fromARGB(255, 147, 24, 24),
                                  size: 19,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                         
                         
                         
                         
                          SizedBox(height: 40),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/forgotpassword");
                              },
                              child: Text(
                                "Forgot password? ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            height: 40,
                            width: 400,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15,
                                  ),
                                ),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  147,
                                  24,
                                  24,
                                ),
                              ),
                              onPressed: () async {
                                print("Attempting Login...");

                                var response = await ApiService.login(
                                  EmailController.text,
                                  passwordController.text,
                                );

                                if (response["success"] == true ||
                                    response["accessToken"] != null) {
                                  print("✅ Login Success!");

                                  // Extract token based on your API response structure
                                  String token =
                                      response["accessToken"] ??
                                      response["data"]["accessToken"];
                                  print("Token: $token");

                                  if (context.mounted) {
                                    Navigator.pushNamed(
                                      context,
                                      "/pin",
                                      arguments: {
                                        "phoneNumber": EmailController.text,
                                        "token": token,
                                      },
                                    );
                                  }
                                } else {
                                  print("❌ Login Failed");

                                  // Handling nested error message from your specific API response
                                  String errorMsg = "Wrong email or password";
                                  if (response["error"] != null &&
                                      response["error"]["message"] != null) {
                                    errorMsg = response["error"]["message"];
                                  }

                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(errorMsg)),
                                    );
                                  }
                                }
                              },
                              label: Text(
                                "Login ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text("Or", style: TextStyle(fontSize: 20)),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            height: 40,
                            width: 400,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15,
                                  ),
                                ),
                                backgroundColor: const Color(0xFF3B5998),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    "Connect with facebook",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            height: 40,
                            width: 400,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15,
                                  ),
                                ),
                                backgroundColor: const Color(0xFF4285F4),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    height: 28,
                                    width: 28,

                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/google-color-svgrepo-com.svg",
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    "Connect with Google",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
