import 'package:lezazel_flutter/models/user_model.dart';
import 'package:dio/dio.dart' as dio;

class AuthService {
  static const String baseUrl = "https://www.lezazelfood.shop/api/";

  final dio.Dio _dio = dio.Dio();

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    String url = '$baseUrl/register';
    final response = await _dio.post(
      url,
      data: {
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "gender": gender,
        "password": password,
      },
      options: dio.Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception(response.data["message"]);
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    String url = '$baseUrl/login';
    final response = await _dio.post(
      url,
      data: {
        "email": email,
        "password": password,
      },
      options: dio.Options(
        headers: {
          "Content-Type": "application/json",
        },
      )
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception(response.data["message"]);
    }
  }

  Future<void> logout(String token) async {
    String url = '$baseUrl/logout';
    final response = await _dio.post(
      url,
      options: dio.Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to logout");
    }
  }
}
