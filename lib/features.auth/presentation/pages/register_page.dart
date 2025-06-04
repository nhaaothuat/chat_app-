import 'package:chat_app/core/theme.dart';
import 'package:chat_app/features.auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues(){
      String username = _usernameController.text;
      String email = _emailNameController.text;
      String password =_passwordController.text;

      print("UserName: $username - Email: $email - Password: $password");
  }

  @override
  void dispose() {
   _usernameController.dispose();
   _passwordController.dispose();
   _emailNameController.dispose();
    super.dispose();
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

              AuthInputField(hint: "UserName", controller: _usernameController,  icon: Icons.person),
              SizedBox(
                height: 20,
              ),

              AuthInputField(hint:"Email", controller: _emailNameController, icon: Icons.person),
              SizedBox(
                height: 20,
              ),
              _buildTextInput("Password", Icons.person, _passwordController,isPassword: true),
              SizedBox(
                height: 20,
              ),
              _buildRegisterButton(),
              SizedBox(
                height: 20,
              ),
              _buildLoginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput(
      String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
          color: DefaultColors.sentMessageInput,
          borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _showInputValues,
      style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.symmetric(vertical: 15)),
      child: Text(
        "Register",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
            text: TextSpan(
                text: "Already have an account ?",
                style: TextStyle(color: Colors.grey),
                children: [
              TextSpan(
                  text: "Click here to login",
                  style: TextStyle(color: Colors.blue))
            ])),
      ),
    );
  }
}
