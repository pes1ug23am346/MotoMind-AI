import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/services/api_service.dart';
import '../core/constants/app_constants.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  UserModel? _user;

  String? get token => _token;
  UserModel? get user => _user;
  bool get isLoggedIn => _token != null;

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(AppConstants.tokenKey);
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    final res = await ApiService.post("/auth/register", {
      "name": name,
      "email": email,
      "password": password,
    });
    await _saveSession(res);
  }

  Future<void> login(String email, String password) async {
    final res = await ApiService.post("/auth/login", {
      "email": email,
      "password": password,
    });
    await _saveSession(res);
  }

  Future<void> _saveSession(Map<String, dynamic> res) async {
    _token = res["token"];
    _user = UserModel.fromJson(res["user"]);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.tokenKey, _token!);
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.tokenKey);
    notifyListeners();
  }
}
