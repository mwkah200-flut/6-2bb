import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/services/storage_service.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000/api/v1";

  static Future<Map<String, dynamic>> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    final url = Uri.parse('$baseUrl/profile/change-password');

    String? token = await StorageService.getToken();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "currentPassword": currentPassword,
          "newPassword": newPassword,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"success": true, "message": "Password changed successfully"};
      } else if (response.statusCode == 400) {
        return {"success": false, "message": "Current password is incorrect"};
      } else if (response.statusCode == 401) {
        return {
          "success": false,
          "message": "Unauthorized: Please login again",
        };
      } else {
        return {"success": false, "message": "Error: ${response.statusCode}"};
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Connection error: Check your internet",
      };
    }
  }

  static Future<bool> refreshTokenLogic() async {
    final url = Uri.parse('$baseUrl/auth/refresh');
    String? refreshToken = await StorageService.getRefreshToken();

    if (refreshToken == null) return false;

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"refreshToken": refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // تحديث الـ Access Token الجديد فقط
        await StorageService.saveToken(data['accessToken']);
        print("✅ Access Token Refreshed Successfully");
        return true;
      } else {
        print("❌ Refresh Token Expired or Invalid");
        await StorageService.clearAll(); // امسح الكل لو الـ refresh باظ
        return false;
      }
    } catch (e) {
      print("❌ Refresh Token Error: $e");
      return false;
    }
  }

  static Future<Map<String, dynamic>> login(
    String emailorphone,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"emailOrPhone": emailorphone, "password": password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['accessToken'] != null)
          await StorageService.saveToken(data['accessToken']);
        if (data['refreshToken'] != null)
          await StorageService.saveRefreshToken(data['refreshToken']);
      }

      return data;
    } catch (e) {
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
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Connection Error"};
    }
  }

  static Future<http.Response> forgotPassword(String email) async {
    final url = Uri.parse('$baseUrl/auth/forgot-password');
    try {
      return await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );
    } catch (e) {
      rethrow;
    }
  }

  // --- 5. ميثود الـ Verify Phone ---
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
        body: jsonEncode({"code": code.toString().trim()}),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Connection Error"};
    }
  }

  static Future<bool> logout() async {
    final url = Uri.parse('$baseUrl/auth/logout');
    String? token = await StorageService.getToken();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        await StorageService.clearAll();
        return true;
      }
      return false;
    } catch (e) {
      print("Logout Error: $e");
      return false;
    }
  }

  static Future<Map<String, dynamic>> getProfile() async {
    // 1. تأكد من المسار الكامل (هل محتاج /api/v1 ؟)
    final url = Uri.parse('$baseUrl/profile');

    // 2. نجيب التوكن ونطبع قيمته للتأكد (Debug)
    String? token = await StorageService.getToken();
    print("Using Token: $token");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', // تأكد من كلمة Bearer ومسافة بعدها
        },
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return {
          "success": true,
          "data": decodedData is Map && decodedData.containsKey('data')
              ? decodedData['data']
              : decodedData,
        };
      } else {
        return {
          "success": false,
          "message": "Server Error: ${response.statusCode}",
        };
      }
    } catch (e) {
      print("Exception in getProfile: $e");
      return {"success": false, "message": "Connection Error"};
    }
  }

  static Future<Map<String, dynamic>> getAllRestaurants({
    int page = 1,
    int limit = 10,
    String? categoryId,
    double? rating,
    double? maxDeliveryFee,
    double? minOrder,
    String? search,
    String sortBy = "rating",
    String sortOrder = "desc",
  }) async {
    final queryParameters = {
      'page': page.toString(),
      'limit': limit.toString(),
      'sortBy': sortBy,
      'sortOrder': sortOrder,
    };

    if (categoryId != null) queryParameters['categoryId'] = categoryId;
    if (rating != null) queryParameters['rating'] = rating.toString();
    if (maxDeliveryFee != null)
      queryParameters['maxDeliveryFee'] = maxDeliveryFee.toString();
    if (minOrder != null) queryParameters['minOrder'] = minOrder.toString();
    if (search != null) queryParameters['search'] = search;

    final url = Uri.parse(
      '$baseUrl/restaurants',
    ).replace(queryParameters: queryParameters);

    String? token = await StorageService.getToken();

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {"success": true, "data": data["data"] ?? data};
    } else {
      return {"success": false, "message": data["message"] ?? "Error"};
    }
  }

static Future<Map<String, dynamic>> getCategories() async {
  final url = Uri.parse('$baseUrl/restaurants/categories');

  String? token = await StorageService.getToken();

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },
  );

  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return {
      "success": true,
      "data": data["data"] ?? data,
    };
  } else {
    return {
      "success": false,
      "message": data["message"] ?? "Error",
    };
  }
}

static Future<Map<String, dynamic>> getRecommendedRestaurants({
  int limit = 10,
}) async {
  final url = Uri.parse(
    '$baseUrl/restaurants/recommended?limit=$limit',
  );

  String? token = await StorageService.getToken();

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },
  );

  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return {
      "success": true,
      "data": data["data"] ?? data,
    };
  } else {
    return {
      "success": false,
      "message": data["message"] ?? "Error",
    };
  }
}



static Future<Map<String, dynamic>> getRestaurantById(String id) async {
  final url = Uri.parse('$baseUrl/restaurants/$id');

  String? token = await StorageService.getToken();

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print("RESTAURANT DETAILS: $data"); 
    return data;
  } else {
    print("ERROR: ${response.body}");
    return {"success": false};
  }
}
static Future<Map<String, dynamic>> updateCartItem(
  String id,
  int quantity,
  String? specialInstructions,
) async {
  final url = Uri.parse('$baseUrl/cart/items/$id');

  String? token = await StorageService.getToken();

  final response = await http.patch(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      "quantity": quantity,
      "specialInstructions": specialInstructions ?? "",
    }),
  );

  final data = jsonDecode(response.body);

  return data;
}
}



