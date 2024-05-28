import 'package:flutter/material.dart';
import 'package:lezazel_flutter/models/user_model.dart';
import 'package:lezazel_flutter/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel get userModel => _user!;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
          name: name,
          username: username,
          email: email,
          phone: phone,
          gender: gender,
          password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
