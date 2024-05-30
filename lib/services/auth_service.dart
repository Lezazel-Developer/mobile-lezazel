import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lezazel_flutter/models/user_model.dart';

class AuthService {
  static const String baseUrl = "https://www.lezazelfood.shop/api";

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String phone,
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
        "phone": phone,
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
    print(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
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
