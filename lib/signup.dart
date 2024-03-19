import 'package:flutter/material.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //logo
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Image.asset('lib/images/logo-no-background.png', width: 60,),
              ),
              const SizedBox(height: 60),

              //sign up text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create an Account, Let’s Get Started!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'inter',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //name field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _nameController,
                  cursorColor: accentColor,
                  decoration: InputDecoration(
                    labelText: '   Name',
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
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

                //email and password fields
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
                          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                            return 'Password must have at least 8 characters\nwith numbers, special characters, and letters';
                          }
                          return null;
                        },
                  ),
                ),

                //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {

                    },
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
              
              const SizedBox(height:20),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Button(
                  buttonText: 'Sign Up',
                  onPressed: () {
      if (_formKey.currentState!.validate()) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SignInPage()),
        // );
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
              content: Text('Please Wait...'),
              backgroundColor: accentColor,
            ));
        //backend code here
      }
    },
                  color: 'orange',
                  enableIcon: false,
                  isStroked: false,
                ),
              ),

              //new to sealtech
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
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
      ),
    );
  }
}