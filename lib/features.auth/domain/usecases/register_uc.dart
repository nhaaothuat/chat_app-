import 'package:chat_app/features.auth/domain/enities/user_enity.dart';
import 'package:chat_app/features.auth/domain/repositories/auth_repository.dart';

class RegisterUseCase{
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<UserEnity> call(String username,String email,String password){
    return repository.register(username, email, password);
  }
}