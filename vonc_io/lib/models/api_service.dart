import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      return jsonDecode(response.body);
    } else {
      throw Exception("failed to register");
    }
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print(" Response status: ${response.statusCode}");
      print(" Response body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (error, stackTrace) {
      print('Error occurred: $error');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> registerphn(String phoneNumber ) async {
    final response = await http.post(
      Uri.parse('$apiUrl/send-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phnno': phoneNumber}),
    );

    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "Failed to register: ${response.body}"); 
      }
    } catch (e) {
      throw Exception('Failed to register: $e'); 
    }
  }

  Future<Map<String, dynamic>> validateOtp(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('$apiUrl/validate-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phnno': otp}),
    );

    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body); 
      } else {
        throw Exception(
            "Failed to register: ${response.body}"); 
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
