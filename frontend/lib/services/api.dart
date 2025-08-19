import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class Api {

  static Future<Map<String, dynamic>> register(String email, String password) async {
        final baseUrl = await getBaseUrl();

    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      return {"success": false, "message": "Registration failed"};
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    
    final baseUrl = await getBaseUrl();

    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    final Map<String, dynamic> data = jsonDecode(response.body);
    return {
      "success": response.statusCode == 200,
      "message": data["message"] ?? "Unknown error",
    };
    }
  }
