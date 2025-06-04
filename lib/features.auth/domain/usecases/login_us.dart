import 'package:chat_app/features.auth/domain/enities/user_enity.dart';
import 'package:chat_app/features.auth/domain/repositories/auth_repository.dart';

class LoginUseCase{
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<UserEnity> call(String email,String password){
    return repository.login(email, password);
  }
}