import 'package:flutter/material.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class InviteFriends extends StatefulWidget {
  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  final _formKey = GlobalKey<FormState>();
  String _friendEmail = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // backend logic
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
                  onPressed: () {},
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