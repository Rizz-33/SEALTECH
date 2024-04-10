
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sealtech/Employee/navbarE.dart';
import 'package:sealtech/client/navbar.dart';
import 'package:sealtech/services/auth/sigin_or_signup.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            if (checkUserRole(snapshot.data!)) {
              return NavbarE();
            } else {
              return NavbarC();
            }
          }
          else {
            return const SigninOrSignup();
          }
        },
      ),
    );
  }
  
  bool checkUserRole(User user) {
    String email = user.email!;
    
    if (email.endsWith('@sealtech.com')) {
      return true;
    } else {
      return false;
    }
  }
}






