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
  double _rating = 0;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //back end logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Give Us Feedback'),
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
                  maxLines: 5,
                ),
                SizedBox(height: 32),
                Text(
                  'Rate Us',
                  style: TextStyle(
                    fontSize: 16,
                    color: accentColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 32),
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