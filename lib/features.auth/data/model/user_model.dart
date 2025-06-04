import 'package:chat_app/features.auth/domain/enities/user_enity.dart';

class UserModel extends UserEnity {
  UserModel({
    required String id,
    required String username,
    required String email,
  }) : super(id: id, username: username, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], username: json['username'], email: json['email']);
  }
}
