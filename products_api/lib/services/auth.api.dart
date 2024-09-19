import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_api/models/login.dart';
import 'package:products_api/models/user.dart';

class AuthAPI {
  static Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        body: jsonEncode(loginRequest.toJson()),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load data');
    }
  }

  static Future<User> getOneUser(int id) async {
    final userResponse =
        await http.get(Uri.parse('https://fakestoreapi.com/users/$id'));
    try {
      if (userResponse.statusCode == 200) {
        dynamic data = jsonDecode(userResponse.body);
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }
}
