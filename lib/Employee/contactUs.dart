import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Contact Us',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: const Color.fromARGB(255, 70, 66, 68),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
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
            bottomLeft: Radius.circular(18),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.00,
        backgroundColor: const Color.fromRGBO(251, 147, 0, 1),
      ),
      backgroundColor: const Color.fromRGBO(255, 252, 245, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContactInfo(
              label: 'Company Name',
              value: 'Your Company Name',
            ),
            const SizedBox(height: 20),
            const ContactInfo(
              label: 'Address',
              value: '123 Main Street, City, Country',
            ),
            const SizedBox(height: 20),
            const ContactInfo(
              label: 'Telephone',
              value: '+1234567890',
            ),
            const SizedBox(height: 20),
            const ContactInfo(
              label: 'Email',
              value: 'info@yourcompany.com',
            ),
            const SizedBox(height: 20),
            const ContactInfo(
              label: 'Website',
              value: 'www.yourcompany.com',
            ),
            const SizedBox(height: 20),
            const Text(
              'Hours of Operation',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Monday - Friday: 9:00 AM - 5:00 PM\nSaturday - Sunday: Closed',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Reach Us',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    // Navigate to Facebook page
                  },
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Navigate to Twitter page
                  },
                ),
                IconButton(
                  icon: Icon(Icons.messenger),
                  onPressed: () {
                    // Navigate to Instagram page
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ContactInfo extends StatelessWidget {
  final String label;
  final String value;

  const ContactInfo({
    required this.label,
    required this.value,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
