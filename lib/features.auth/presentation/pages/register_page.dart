import 'package:chat_app/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_event.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_state.dart';
import 'package:chat_app/features.auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features.auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/features.auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _showInputValues(){
  //     String username = _usernameController.text;
  //     String email = _emailNameController.text;
  //     String password =_passwordController.text;
  //
  //     print("UserName: $username - Email: $email - Password: $password");
  // }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailNameController.dispose();
    super.dispose();
  }

  void _onRegister() {
    // _showInputValues();
    BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
        username: _usernameController.text,
        email: _emailNameController.text,
        password: _passwordController.text,));

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
                  hint: "UserName",
                  controller: _usernameController,
                  icon: Icons.person),
              SizedBox(
                height: 20,
              ),
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
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return AuthButton(text: "Register", onPressed: _onRegister);
              }, listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, "/login");
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
                    Navigator.pushNamed(context, '/login');
                  },
                  subtitle: "Click here to login",
                  title: "Already have an account")
            ],
          ),
        ),
      ),
    );
  }
}
