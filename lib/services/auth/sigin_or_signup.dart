import 'package:flutter/material.dart';
import 'package:sealtech/signin.dart';
import 'package:sealtech/signup.dart';

class SigninOrSignup extends StatefulWidget {
  const SigninOrSignup({super.key});

  @override
  State<SigninOrSignup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SigninOrSignup> {

  //initially show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return SignInPage(
        onTap: togglePages,
      );
    } else {
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}