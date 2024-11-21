import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signup'), // Use the correct URL for registration
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body); // Return the entire response
    } else {
      throw Exception(
          'Failed to register user: ${response.body}'); // Throw an exception for non-201 responses
    }
  }

  Future<Map<String, dynamic>> loginUser(String userId, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/signup'), // Use the correct URL for login
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': userId,
          'password': password,
        }),
      );

      // Print the response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // If the response is not successful, throw an exception with details
        throw Exception('Failed to log in user: ${response.body}');
      }
    } catch (error, stackTrace) {
      // Print detailed error information
      print('Error occurred: $error');
      print('Stack trace: $stackTrace');
      rethrow; // Optionally rethrow if needed
    }
  }
}
