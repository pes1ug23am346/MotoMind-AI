import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';

class ApiService {
  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body, {
    String? token,
  }) async {
    final response = await http.post(
      Uri.parse("${AppConstants.baseUrl}$endpoint"),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    return _handle(response);
  }

  static Future<dynamic> get(String endpoint, {String? token}) async {
    final response = await http.get(
      Uri.parse("${AppConstants.baseUrl}$endpoint"),
      headers: {
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    return _handle(response);
  }

  static dynamic _handle(http.Response response) {
    final decoded = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    }
    throw Exception(decoded["message"] ?? "Something went wrong");
  }
}
