import 'dart:convert';

import 'package:chat_app/features.auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  final String baseUrl = "https://be-native.onrender.com/auth";

  Future<UserModel> login(
      {required String email, required String password}) async {
    final res = await http.post(Uri.parse('$baseUrl/sign-in'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'});
    return UserModel.fromJson(jsonDecode(res.body));
  }

  Future<UserModel> register(
      {required String username,
      required String email,
      required String password}) async {
    final res = await http.post(Uri.parse('$baseUrl/sign-up'),
        body: jsonEncode(
            {'email': email, 'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});
    return UserModel.fromJson(jsonDecode(res.body));
  }
}
