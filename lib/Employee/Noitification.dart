import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/button.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationSettingsPage(),
  ));
}

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  // Controllers for managing notification preferences
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pushNotificationController =
      TextEditingController();
  final TextEditingController smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Notification Settings',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: const Color.fromARGB(255, 70, 66, 68),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        titleSpacing: 4.0,
        toolbarHeight: 65,
        toolbarOpacity: 0.9,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18)),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.00,
        backgroundColor: const Color.fromRGBO(251, 147, 0, 1),
      ),
      backgroundColor: const Color.fromRGBO(255, 252, 245, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            _buildNotificationSetting(
              'Receive Email Notifications',
              emailController,
            ),
            const SizedBox(height: 5),
            _buildNotificationSetting(
              'Receive Push Notifications',
              pushNotificationController,
            ),
            const SizedBox(height: 5),
            _buildNotificationSetting(
              'Receive SMS Notifications',
              smsController,
            ),
            const SizedBox(height: 20),
            Button(
              buttonText: 'Save Preferences',
              onPressed: () {
                _saveNotificationPreferences();
              },
              color: 'orange',
              enableIcon: false,
              isStroked: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSetting(
      String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: controller.text.toLowerCase() == 'true',
          onChanged: (value) {
            setState(() {
              controller.text = value.toString();
            });
          },
          activeColor: Color.fromRGBO(255, 132, 0, 1),
          inactiveThumbColor: Color.fromRGBO(255, 132, 0, 1),
        ),
      ],
    );
  }

  void _saveNotificationPreferences() {
    // Implement logic to save notification preferences
    // For example, you can save these values to a database or perform other actions
    String emailNotification = emailController.text;
    String pushNotification = pushNotificationController.text;
    String smsNotification = smsController.text;

    // Print or use the values as needed
    print('Email Notification: $emailNotification');
    print('Push Notification: $pushNotification');
    print('SMS Notification: $smsNotification');
  }
}
