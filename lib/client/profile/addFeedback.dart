import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  String _feedback = '';
  String _comment = '';
  double _rating = 0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _sendFeedbackToFirestore();
    }
  }

  void _sendFeedbackToFirestore() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? email = user?.email;

    if (email != null) {
      _firestore.collection('feedback').add({
        'email': email,
        'feedback': _feedback,
        'comment': _comment,
        'rating': _rating,
        'timestamp': Timestamp.now(),
      }).then((value) {
        _showAlertDialog('Success', 'Feedback submitted successfully');
      }).catchError((error) {
        _showAlertDialog('Error', 'Failed to submit feedback: $error');
      });
    } else {
      _showAlertDialog('Error', 'User email or name not available.');
    }
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give Us Feedback'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  cursorColor: accent75,
                  decoration: InputDecoration(
                    labelText: 'Feedback',
                    labelStyle: TextStyle(color: accentColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your feedback';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _feedback = value!;
                  },
                  maxLines: 2,
                ),
                TextFormField(
                  cursorColor: accent75,
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(color: accentColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your comment';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _comment = value!;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 35),
                Text(
                  'Rate Us',
                  style: TextStyle(
                    fontSize: 16,
                    color: accentColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 36,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: primaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                const SizedBox(height: 32),
                Button(
                  buttonText: 'Submit',
                  onPressed: _submit,
                  color: 'orange',
                  enableIcon: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
