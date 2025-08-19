import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';


class Api{
    static Future<void> register(String username, String password) async {
    final baseUrl = await ApiConfig.getBaseUrl();
    final url = Uri.parse("$baseUrl/register");

    final response = await http.post(url, body: {
      "username": username,
      "password": password,
    });

    if (response.statusCode == 200) {
      print("✅ Registered successfully: ${response.body}");
    } else {
      print("❌ Error: ${response.body}");
    }
  }

  static Future<void> login(String username, String password) async {
    final baseUrl = await ApiConfig.getBaseUrl();
    final url = Uri.parse("$baseUrl/login");
    final response = await http.post(url, body: {
      "username": username,
      "password": password,
    });
    if (response.statusCode == 200) {
      print("✅ Registered successfully: ${response.body}");
    } else {
      print("❌ Error: ${response.body}");
    }
  }
}
