// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Pin extends StatefulWidget {
  final String phonenumber;
  const Pin({super.key, required this.phonenumber});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  final codeController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("PiN")),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            width: double.infinity,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Verify phone number", style: TextStyle(fontSize: 30)),
                    SizedBox(height: 30),
                    Text(
                      "Enter the 4-digit code sent to you at your phone number",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: PinCodeTextField(
                    controller: codeController,
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    pinTheme: PinTheme(
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeColor: const Color.fromARGB(255, 147, 24, 24),
                      selectedColor: Colors.green,
                      inactiveColor: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromARGB(255, 147, 24, 24),
                    ),
               onPressed: isLoading
    ? null
    : () async {
        if (codeController.text.length < 6) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please enter the 6-digit code"),
            ),
          );
          return;
        }

        final args = ModalRoute.of(context)?.settings.arguments as Map?;
        final String userId = args?["userId"] ?? "";

        setState(() => isLoading = true);

        var response = await ApiService.verifyLoginOtp(
          codeController.text,
          userId,
        );

        setState(() => isLoading = false);

        print("VERIFY RESPONSE: $response");

        if (response["success"] == true) {

          Navigator.pushNamedAndRemoveUntil(
            context,
            "/homepage",
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response["message"] ?? "Verification failed",
              ),
            ),
          );
        }
      },
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Continue",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
