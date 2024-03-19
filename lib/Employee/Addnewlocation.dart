import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class NewLocation_Page extends StatefulWidget {
  const NewLocation_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<NewLocation_Page> createState() => _NewLocation_PageState();
}

class _NewLocation_PageState extends State<NewLocation_Page> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController duePaymentController = TextEditingController();

  void _showValidationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Missing Information',
            style: TextStyle(
                color: Color.fromARGB(255, 94, 95, 94),
                fontSize: 20), // Change title color
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
    String title = titleController.text;
    String deadline = deadlineController.text;
    String location = locationController.text;
    String duePayment = duePaymentController.text;

    if (title.isEmpty ||
        deadline.isEmpty ||
        location.isEmpty ||
        duePayment.isEmpty) {
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
              'Location added successfully!',
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
                'Ongoing Locations',
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
                      'lib/images/Locationdetailed.png',
                      height: 200,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title of the construction',
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
                  controller: deadlineController,
                  decoration: InputDecoration(
                    labelText: 'Deadline',
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
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Location of site',
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
                  controller: duePaymentController,
                  decoration: InputDecoration(
                    labelText: 'Due payment',
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
                    String title = titleController.text;
                    String deadline = deadlineController.text;
                    String location = locationController.text;
                    String duePayment = duePaymentController.text;

                    _showSuccessDialog(context);

                    // Do something with the user input
                    print(
                        'Title: $title, Deadline: $deadline, Location: $location, Due Payment: $duePayment');
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
