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

  static Future<User?> updateProfile(int id, User user) async {
    final url = Uri.parse('https://fakestoreapi.com/users/$id');
    try {
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': user.email,
          'username': user.username,
          'password': user.password,
          'name': {
            'firstname': user.name?.firstname,
            'lastname': user.name?.lastname,
          },
          'address': {
            'city': user.address?.city,
            'street': user.address?.street,
            'number': user.address?.number,
            'zipcode': user.address?.zipcode,
            'geolocation': {
              'lat': user.address?.geolocation?.lat,
              'long': user.address!.geolocation?.long,
            },
          },
          'phone': user.phone,
        }),
      );

      if (response.statusCode == 200) {
        // Decode the response body
        dynamic data = jsonDecode(response.body);

        // Create and return an updated User object
        User updatedUser = User.fromJson(data);
        return updatedUser;
      } else {
        print('Failed to update profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error updating profile: $e');
      return null;
    }
  }
}
