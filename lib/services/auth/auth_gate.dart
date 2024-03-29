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
          // user logged in
          if (snapshot.hasData) {
            if (checkUserRole(snapshot.data!)) {
              return NavbarE();
            } else {
              return NavbarC();
            }
          }
          // user is not logged in
          else {
            return const SigninOrSignup();
          }
        },
      ),
    );
  }
  
  // method to check user role (admin/client)
  bool checkUserRole(User user) {
    // Extracting the password from user email
    String password = user.email!.split('@')[0].substring(1);
    
    // Check if the password starts with '101'
    return password.startsWith('101');
  }
}
