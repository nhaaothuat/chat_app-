import 'package:chat_app/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_event.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_state.dart';
import 'package:chat_app/features.auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features.auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/features.auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailNameController.dispose();
    super.dispose();
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
      email: _emailNameController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(
                  hint: "Email",
                  controller: _emailNameController,
                  icon: Icons.person),
              SizedBox(
                height: 20,
              ),
              AuthInputField(
                  hint: "Password",
                  controller: _passwordController,
                  icon: Icons.person,
                  isPassword: true),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return AuthButton(text: "Login", onPressed: _onLogin);
              }, listener: (context, state) {
                if (state is AuthSuccess) {

                  Navigator.pushNamed(context, "/chat");
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              }),
              SizedBox(
                height: 20,
              ),
              LoginPrompt(
                  onTap: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  subtitle: "Register",
                  title: "Haven't already an account?")
            ],
          ),
        ),
      ),
    );
  }
}
