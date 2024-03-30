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
  String _userEmail = ''; // User's email obtained from AuthService

  AuthService _authService = AuthService(); // Instance of AuthService

  @override
  void initState() {
    super.initState();
    _getCurrentUserEmail(); // Call method to fetch current user's email
  }

  // Method to fetch current user's email
  void _getCurrentUserEmail() async {
    User? userData = await _authService.getCurrentUser();
    setState(() {
      _userEmail = userData?.email ?? ''; // Set user's email
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      // Email content
      String subject = 'Invitation to Join';
      String body = 'Hi there! I invite you to join our app.';
      
      // Configure SMTP server details
      final smtpServer = gmail(_userEmail, 'your_password'); // Replace with sender's email and password
      
      // Create message
      final message = Message()
        ..from = Address(_userEmail)
        ..recipients.add(_friendEmail)
        ..subject = subject
        ..text = body;
      
      // Send email
      try {
        await send(message, smtpServer);
        // Email sent successfully
        print('Email sent successfully');
      } catch (e) {
        // Failed to send email
        print('Error sending email: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite Friends'),
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
                  decoration: InputDecoration(
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
                SizedBox(height: 32),
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
