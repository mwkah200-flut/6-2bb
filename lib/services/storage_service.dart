import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', token); 
}

static Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}


  static Future<void> saveRefreshToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("refreshToken", token);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("refreshToken");
  }

  static Future<void> saveTempEmail(String email) async {
    final prefs = await SharedPreferences.getInstance(); 
    await prefs.setString('temp_email', email);
  }

  static Future<String?> getTempEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('temp_email');
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); 
  }
}