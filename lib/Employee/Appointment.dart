import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class Appoinment_Page extends StatefulWidget {
  const Appoinment_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Appoinment_Page> createState() => _Appoinment_PageState();
}

class _Appoinment_PageState extends State<Appoinment_Page> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController appointmentWithController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  void _showValidationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Missing Information',
            style: TextStyle(
                color: Color.fromARGB(255, 94, 95, 94),
                fontSize: 20), // Change title color and font size
          ),
          content: const Text(
            'Please fill out all fields before continuing.',
            style:
                TextStyle(color: Color.fromARGB(255, 94, 95, 94), fontSize: 14),
          ),
          backgroundColor: secondary50,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the validation dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    // Validation check before showing the success dialog
    String name = nameController.text;
    String appointmentWith = appointmentWithController.text;
    String date = dateController.text;
    String time = timeController.text;
    String duration = durationController.text;

    if (name.isEmpty ||
        appointmentWith.isEmpty ||
        date.isEmpty ||
        time.isEmpty ||
        duration.isEmpty) {
      // Show validation error dialog
      _showValidationDialog(context);
    } else {
      // All fields are filled, show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Success',
              style: TextStyle(
                  color: Color.fromARGB(255, 94, 95, 94), fontSize: 22),
            ),
            content: const Text(
              'Appoinment added successfully!',
              style: TextStyle(
                  color: Color.fromARGB(255, 94, 95, 94), fontSize: 14),
            ),
            backgroundColor: secondary25,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Go back to the home page
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),
                ),
              ),
            ],
          );
        },
      );
    }
  }

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
                'Appointment',
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Image.asset(
                      'lib/images/Appointment.png',
                      height: 200,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: const UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: appointmentWithController,
                  decoration: InputDecoration(
                    labelText: 'Who do you want to make an appointment with?',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: const UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Available date',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: const UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: timeController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Available time',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: const UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: durationController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: const UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Button(
                  buttonText: 'Submit',
                  onPressed: () {
                    // Access the user input using the controllers
                    String name = nameController.text;
                    String appointmentWith = appointmentWithController.text;
                    String date = dateController.text;
                    String time = timeController.text;
                    String duration = durationController.text;

                    // Do something with the user input
                    print(
                        'Name: $name, Appointment with: $appointmentWith, Date: $date, Time: $time, Duration: $duration');

                    // Show success dialog
                    _showSuccessDialog(context);
                  },
                  color: 'orange',
                  enableIcon: false,
                  isStroked: false,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
