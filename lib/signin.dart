import 'package:flutter/material.dart';
import 'package:sealtech/Employee/navbarE.dart';
import 'package:sealtech/client/navbar.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/services/auth/auth_service.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  SignInPage({Key? key, this.onTap});

  void signin(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try log in
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );

      // Extracting the password from user email
      String password = _emailController.text.split('@')[0].substring(3);

      // Check if the password starts with '101'
      if (password.startsWith('101')) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavbarE()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavbarC()),
        );
      }
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset(
                  'lib/images/logo-no-background.png',
                  width: 60,
                ),
              ),
              const SizedBox(height: 60),

              // sign in text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign In and Start Exploring!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'inter',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // email and password fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: _emailController,
                        cursorColor: accentColor,
                        decoration: InputDecoration(
                          labelText: '   Email',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: accentColor),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: _passwordController,
                        cursorColor: accentColor,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: '   Password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: accentColor),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                            return 'Password must have at least 8 characters\nwith numbers, special characters, and letters';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 110, 110, 110),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),

              // sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Button(
                  buttonText: 'Sign In',
                  onPressed: () => signin(context),
                  color: 'orange',
                  enableIcon: false,
                  isStroked: false,
                ),
              ),

              // new to sealtech
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New to SEALTECH?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: const Text(
                        '   Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
