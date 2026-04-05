import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000/api/v1";

  static Future<Map<String, dynamic>> login(
    String emailorphone,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/auth/login');
    print("👉 Login URL: $url");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"emailOrPhone": emailorphone, "password": password}),
      );

      print("👉 STATUS: ${response.statusCode}");
      return jsonDecode(response.body);
    } catch (e) {
      print("❌ Login Error: $e");
      return {"success": false, "message": "Connection Error"};
    }
  }

  static Future<Map<String, dynamic>> register(
    String fullName,
    String email,
    String password,
    String phone,
  ) async {
    final url = Uri.parse('$baseUrl/auth/signup');
    print("👉 Register URL: $url");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "password": password,
          "phone": phone,
        }),
      );

      print("👉 STATUS: ${response.statusCode}");
      print("👉 BODY: ${response.body}");

      return jsonDecode(response.body);
    } catch (e) {
      print("❌ Register Error: $e");
      return {"success": false, "message": "Connection Error"};
    }
  }

  static Future<Map<String, dynamic>> verifyPhone(
    String code,
    String token,
  ) async {
    final url = Uri.parse('$baseUrl/auth/verify-phone');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "code": code.toString().trim(), // بنتأكد إنه String ومفيهوش مسافات
        }),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Connection Error"};
    }
  }
}
