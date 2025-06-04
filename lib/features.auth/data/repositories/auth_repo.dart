import 'package:chat_app/features.auth/data/datasource/auth_datasource.dart';
import 'package:chat_app/features.auth/domain/enities/user_enity.dart';
import 'package:chat_app/features.auth/domain/repositories/auth_repository.dart';

class AuthRepoImple implements AuthRepository{
 final AuthDataSource authDataSource;

 AuthRepoImple({required this.authDataSource});

  @override
  Future<UserEnity> login(String email, String password) async {
   return  await authDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEnity> register(String username, String email, String password) async{
   return await authDataSource.register(username: username, email: email, password: password);
  }
}