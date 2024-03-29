import 'package:flutter/material.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPaymentMethod = 'Credit Card';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Implement the logic to process the payment
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the theme

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Theme(
                data: theme.copyWith(
                  inputDecorationTheme: theme.inputDecorationTheme.copyWith(
                    labelStyle: TextStyle(color: accentColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: accentColor),
                    ),
                  ),
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Payment Method',
                    fillColor: accentColor,
                  ),
                  value: _selectedPaymentMethod,
                  items: <String>['Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPaymentMethod = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a payment method';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _selectedPaymentMethod = value!;
                  },
                ),
              ),
              SizedBox(height: 32),
              Button(buttonText: 'Submit', onPressed: () {}, color: 'orange', enableIcon: false,)
            ],
          ),
        ),
      ),
    );
  }
}
