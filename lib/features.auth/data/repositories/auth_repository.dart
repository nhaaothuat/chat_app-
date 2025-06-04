import 'package:chat_app/features.auth/domain/enities/user_enity.dart';

abstract class AuthRepository{
  Future<UserEnity> login(String email,String password);
  Future<UserEnity> register(String username,String email,String password);
}