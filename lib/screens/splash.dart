// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart'; // تأكد من إضافة الـ package

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _appLinks = AppLinks(); // تعريف الـ Service
  StreamSubscription? _linkSubscription;

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

 void initDeepLinks() async {
  try {
    final Uri? appLink = await _appLinks.getInitialLink();
    
    if (appLink != null && appLink.path.contains('/reset-password')) {
      final token = appLink.queryParameters['token'];
      if (token != null) {
        Timer(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, "/ChangePassword", arguments: token);
          }
        });
        return; 
      }
    }
  } catch (e) {
    print("Error fetching initial app link: $e");
  }

  Timer(const Duration(seconds: 4), () {
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/Welcome");
    }
  });
}
  @override
  void dispose() {
    _linkSubscription?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 24, 24),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1500),
          tween: Tween<double>(begin: 0, end: 1),
          curve: Curves.easeOutBack,
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "All taste. No waste.",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}