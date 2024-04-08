import 'package:flutter/material.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

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
                  "At Sealtech Construction Pvt Ltd, we uphold the highest standards of privacy and confidentiality for our valued employees. Recognizing the sensitive nature of personal information, we have implemented robust measures to ensure its protection throughout our operations. When collecting personal data, whether it pertains to employment history, financial information, or performance evaluations, we do so with utmost care and transparency. Our employees can trust that their data is used solely for legitimate business purposes, such as payroll processing, benefits administration, and performance management. We understand the importance of maintaining the confidentiality of this information and have implemented strict access controls and encryption protocols to safeguard against unauthorized access or disclosure. Furthermore, we adhere to all relevant legal and regulatory requirements governing the handling of personal data, ensuring compliance at every step. Our commitment to privacy extends beyond mere compliance – it is ingrained in our corporate culture, reflecting our respect for the individual rights and dignity of our employees. As we continue to evolve and innovate in the construction industry, we remain steadfast in our dedication to preserving the privacy and security of our employees' personal information, fostering trust and confidence in our organization."),
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
                        MaterialPageRoute(
                            builder: (context) => PrivacyPolicyPage()),
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
