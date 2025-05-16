import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String _baseUrl =
      'http://192.168.208.89'; 

  Future<dynamic> loginEmployee(String email, String password) async {
    const endpoint = '/employee/login';
    final url = '$_baseUrl$endpoint';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<dynamic> registerEmployee(
      String companyName, String email, String password) async {
    const endpoint = '/employee/signup';
    final url = '$_baseUrl$endpoint';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': companyName, // Use companyName
          'email': email,
          'password': password,
        }),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<dynamic> loginJob(String email, String password) async {
    const endpoint = '/jober/login';
    final url = '$_baseUrl$endpoint';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Request failed with status: ${response.statusCode}, body: ${response.body}');
    }
  }
}
