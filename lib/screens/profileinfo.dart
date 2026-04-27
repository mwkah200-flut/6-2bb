// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart'; // تأكد من المسار

class Profileinfo extends StatefulWidget {
  const Profileinfo({super.key});

  @override
  State<Profileinfo> createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  late Future<Map<String, dynamic>> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = ApiService.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Profile Settings")),
        body: FutureBuilder<Map<String, dynamic>>(
          future: ApiService.getProfile(),
          builder: (context, snapshot) {
            // 1. حالة التحميل
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 147, 24, 24)));
            }

            // 2. حالة الخطأ أو فشل التوكن
            if (snapshot.hasError || (snapshot.data != null && snapshot.data!["success"] == false)) {
              return Center(child: Text("Failed to load profile data"));
            }

            // 3. البيانات وصلت بالسلامة
            final userData = snapshot.data!["data"];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    
                    // Full Name Section
                    _buildInfoSection("FULL NAME", userData["fullName"] ?? "Not Provided"),
                    
                    SizedBox(height: 30),

                    // Email Section
                    _buildInfoSection("EMAIL ADDRESS", userData["email"] ?? "Not Provided"),

                    SizedBox(height: 30),

                    // Phone Section
                    _buildInfoSection("PHONE NUMBER", userData["phone"] ?? "Not Provided"),

                    SizedBox(height: 30),

                    // Password Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PASSWORD", style: TextStyle(color: Colors.grey, fontSize: 16)),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("*************", style: TextStyle(color: Colors.black, fontSize: 18)),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(context, "/changepassword"),
                              child: Text("Change", style: TextStyle(color: Color.fromARGB(255, 147, 24, 24), fontSize: 18)),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                    
                    SizedBox(height: 60),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 147, 24, 24),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: ()  {
                        
                        },
                        label: Text("Change settings", style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 16)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.black, fontSize: 18)),
        Divider(),
      ],
    );
  }
}