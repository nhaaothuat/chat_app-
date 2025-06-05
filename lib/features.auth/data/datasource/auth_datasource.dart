import 'dart:convert';

import 'package:chat_app/features.auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  final String baseUrl = "https://be-native.onrender.com/api/v1/auth";

  Future<UserModel> login(
      {required String email, required String password}) async {
    final res = await http.post(Uri.parse('$baseUrl/sign-in'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'});
    return UserModel.fromJson(jsonDecode(res.body)["result"]);
  }

  Future<UserModel> register(
      {required String username,
      required String email,
      required String password}) async {
    final res = await http.post(Uri.parse('$baseUrl/sign-up'),
        body: jsonEncode(
            {'username': username,'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    print(res.body);

    return UserModel.fromJson(jsonDecode(res.body)["user"]);
  }
}
