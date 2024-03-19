import 'package:flutter/material.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/signup.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool isChecked = false;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy and Security',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        toolbarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "SEALTECH Waterproofing Company is dedicated to safeguarding the privacy of its users. This Privacy Policy delineates how we gather, employ, and uphold your personal data when you utilize the SEALTECH Waterproofing Company App.\nWe may collect various forms of personal information including your name, email address, phone number, and location to facilitate account registration and enhance user experience. Additionally, non-personal data such as device information, IP address, and usage patterns may be gathered to optimize our services and refine user interaction within the app.\nYour personal data is utilized to furnish and personalize our services, establish communication channels with you, and refine the app's functionality. Non-personal data aids us in analytical endeavors, trend monitoring, and overall app administration.\nWe do not engage in the sale, trade, or rental of your personal information to third parties. However, trusted service providers may be granted access to your data to assist in app operation and service delivery. Your information may also be disclosed in response to legal obligations or to safeguard our rights, property, or the safety of others.\nWe employ robust technical and organizational measures to safeguard your personal data against unauthorized access, alteration, disclosure, or destruction. Despite our stringent security protocols, it is imperative to acknowledge that no internet transmission method or electronic storage system is entirely foolproof.\nThe SEALTECH Waterproofing Company App is not intended for individuals under the age of 13, and we do not knowingly collect personal information from this demographic. If you suspect that we have inadvertently acquired information from a child under 13, please notify us promptly.\nWe reserve the prerogative to amend or update this Privacy Policy at any juncture. Such modifications become effective immediately upon their posting on the app. We encourage regular review of this Privacy Policy for any alterations or updates.\nIf you have queries or concerns regarding this Privacy Policy or our privacy practices, please reach out to us via the provided contact details.\nBy utilizing the SEALTECH Waterproofing Company App, you implicitly agree to the terms and stipulations outlined in this Privacy Policy.",
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                        showError = !isChecked;
                      });
                    },
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
                  ),
                  const Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              if (showError)
                Text(
                  'You must agree to the terms and conditions to continue. *',
                  style: TextStyle(color: Colors.red),
                ),
              Center(
                child: Button(
                  buttonText: 'Continue',
                  enableIcon: false,
                  onPressed: () {
                    if (!isChecked) {
                      setState(() {
                        showError = true;
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    }
                  },
                  color: 'orange',
                  isStroked: false,
                  width: 400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
