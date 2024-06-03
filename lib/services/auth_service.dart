import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lezazel_flutter/models/user_model.dart';

class AuthService {
  static const String baseUrl = "https://www.lezazelfood.shop/api";

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String gender,
    required String password,
  }) async {
    String url = '$baseUrl/register';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "username": username,
        "email": email,
        "gender": gender,
        "password": password,
      }),
    );
    final responseData = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return UserModel.fromJson(responseData);
    } else {
      throw Exception(responseData);
    }
  }

Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    String url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    
    final responseData = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return UserModel.fromJson(responseData);
    } else {
      throw Exception(responseData);
    }
  }

  Future<void> logout(String token) async {
    String url = '$baseUrl/logout';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to logout");
    }
  }
}
