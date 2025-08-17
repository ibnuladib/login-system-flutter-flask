import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api{
    static const String baseUrl = "http://127.0.0.1:5000";

    static Future<Map<String, dynamic>> login(String email, String password) async{
        final response = await http.post(
            Uri.parse("$baseUrl/login"),
            headers: {"Content-Type":"application/json"},
            body: jsonEncode({"email":email, "password":password}),
            );
        return jsonDecode(response.body);
    }

    
    static Future<Map<String, dynamic>> register(String email, String password) async{
        final response = await http.post(
            Uri.parse("$baseUrl/login"),
            headers: {"Content-Type":"application/json"},
            body: jsonEncode({"email":email, "password":password}),
            );
        return jsonDecode(response.body);
    }

}
