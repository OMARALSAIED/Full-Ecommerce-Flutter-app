import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class THttpHhelper
{
  static const String _basUrl='';

  //Hepler Method to Get Request



  static const String _baseUrl = 'https://yourapi.com';  // Replace with your base URL

  // Helper Method to Handle GET Request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper Method to Handle POST Request
  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  // Helper Method to Handle PUT Request
  static Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  // Helper Method to Handle DELETE Request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Method to Handle Response for all HTTP Requests
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Successfully returned data
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      // Bad request
      throw Exception('Bad Request: ${response.body}');
    } else if (response.statusCode == 401) {
      // Unauthorized
      throw Exception('Unauthorized: ${response.body}');
    } else if (response.statusCode == 404) {
      // Not found
      throw Exception('Not Found: ${response.body}');
    } else if (response.statusCode == 500) {
      // Server error
      throw Exception('Server Error: ${response.body}');
    } else {
      // Other error
      throw Exception('Error: ${response.body}');
    }
  }
}


