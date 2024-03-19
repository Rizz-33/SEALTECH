import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class DeleteAccountPage extends StatelessWidget {
  // Function to simulate deleting the account
  void _deleteAccount(BuildContext context) {
    // Add your logic for deleting the account here
    // For now, let's just show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Confirm Delete',
            style:
                TextStyle(color: Color.fromARGB(255, 94, 95, 94), fontSize: 20),
          ),
          content: const Text(
            'Are you sure you want to delete your account?',
            style:
                TextStyle(color: Color.fromARGB(255, 94, 95, 94), fontSize: 14),
          ),
          backgroundColor: secondary50,
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform the account deletion action
                // For now, we just navigate back to the previous page
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to the previous page
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),
              ),
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
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Delete My Account',
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
          children: [
            const SizedBox(height: 70),
            const Text(
              'Warning: Deleting your account is irreversible.',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Once you delete your account, all your data will be lost. Additional information about the consequences of deleting the account.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 70,
              child: Button(
                buttonText: 'Save Preferences',
                onPressed: () {
                  _deleteAccount(context);
                },
                color: 'orange',
                enableIcon: false,
                isStroked: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
