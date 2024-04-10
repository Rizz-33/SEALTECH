import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/services/auth/auth_service.dart';

class InviteFriends extends StatefulWidget {
  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  final _formKey = GlobalKey<FormState>();
  String _friendEmail = '';
  String _userEmail = '';

  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _getCurrentUserEmail();
  }

  void _getCurrentUserEmail() async {
    User? userData = await _authService.getCurrentUser();
    setState(() {
      _userEmail = userData?.email ?? '';
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      String subject = 'Invitation to Join';
      String body = 'Hi there! I invite you to join our app.';
      
      final smtpServer = gmail(_userEmail, 'your_password');
      
      final message = Message()
        ..from = Address(_userEmail)
        ..recipients.add(_friendEmail)
        ..subject = subject
        ..text = body;
      
      try {
        await send(message, smtpServer);
        print('Email sent successfully');
      } catch (e) {
        print('Error sending email: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Friends'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: accentColor,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: accentColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: accentColor),
              ),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  cursorColor: accent75,
                  decoration: const InputDecoration(
                    labelText: 'Friend\'s Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your friend\'s email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _friendEmail = value!;
                  },
                ),
                const SizedBox(height: 32),
                Button(
                  buttonText: 'Submit',
                  onPressed: _submit,
                  color: 'orange',
                  enableIcon: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
