import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues(){

      String email = _emailNameController.text;
      String password =_passwordController.text;

      print("Email: $email - Password: $password");
  }

  @override
  void dispose() {

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

              _buildTextInput("Email", Icons.person, _emailNameController),
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
        "Login",
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
                text: "Haven't already have an account ?",
                style: TextStyle(color: Colors.grey),
                children: [
              TextSpan(
                  text: "Click here to register",
                  style: TextStyle(color: Colors.blue))
            ])),
      ),
    );
  }
}
