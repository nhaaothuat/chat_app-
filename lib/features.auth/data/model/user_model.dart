import 'package:chat_app/features.auth/domain/enities/user_enity.dart';

class UserModel extends UserEnity {
  UserModel({
    required String id,
    required String username,
    required String email,
    required String token,
  }) : super(id: id, username: username, email: email, token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] ?? '',
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        token: json['token'] ?? '');
  }
}
