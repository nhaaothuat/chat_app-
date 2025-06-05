import 'package:bloc/bloc.dart';
import 'package:chat_app/features.auth/domain/usecases/login_us.dart';
import 'package:chat_app/features.auth/domain/usecases/register_uc.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_event.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final _storage = FlutterSecureStorage();
  AuthBloc({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await registerUseCase.call(
          event.email, event.password, event.username);

      emit(AuthSuccess(message: "Registration succcessfull"));
    } catch (e) {
      emit(AuthFailed(error: "Failed"));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase.call(event.email, event.password);
      await _storage.write(key: 'token', value: user.token);
      print('token: ${user.token}');
      emit(AuthSuccess(message: "Login succcessfull"));
    } catch (e) {
      print('Login error: $e');
      // emit lỗi chi tiết hơn nếu có thể:
      emit(AuthFailed(error: e.toString()));
      // emit(AuthFailed(error: "Failed"));
    }
  }
}
