import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailsPage extends StatefulWidget {
  final String name;
  final String deadline;
  final String address;
  final double duePayment;

  UserDetailsPage({
    required this.name,
    required this.deadline,
    required this.address,
    required this.duePayment,
  }
);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20, // Add a gap here
            ),
            SizedBox(
              width: 404,
              height: 213,
              child: Image.asset(
                'lib/images/Locationdetailed.png',
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 219, 180),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${widget.name}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Deadline: ${widget.deadline}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Address: ${widget.address}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Due Payment: \$${widget.duePayment.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Progress',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 70, 66, 68),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  MyCheckBoxContainer(title: 'Visit Site'),
                  const SizedBox(height: 10),
                  MyCheckBoxContainer(title: 'Give Quotation'),
                  const SizedBox(height: 10),
                  MyCheckBoxContainer(title: 'Start Work'),
                  const SizedBox(height: 10),
                  MyCheckBoxContainer(title: 'Completion'),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCheckBoxContainer extends StatefulWidget {
  final String title;

  MyCheckBoxContainer({required this.title});

  @override
  _MyCheckBoxContainerState createState() => _MyCheckBoxContainerState();
}

class _MyCheckBoxContainerState extends State<MyCheckBoxContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 330,
        height: 45,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: Colors.white, // Change to your desired background color
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black, // Change to your desired border color
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isChecked
                      ? Colors.black
                      : const Color.fromARGB(0, 83, 76, 76),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: isChecked
                    ? Colors.black
                    : Color.fromARGB(255, 229, 158, 58),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15.0,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 30),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 96, 94, 94),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
