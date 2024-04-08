import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/Employee/Emp-backend/service/database.dart';

class appointmentp extends StatefulWidget {
  const appointmentp({super.key});

  @override
  State<appointmentp> createState() => _appointmentpState();
}

class _appointmentpState extends State<appointmentp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController withWhomController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();

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
                'new appointments',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // Adjust the border radius as needed
                border: Border.all(
                    color: Colors.black, width: 1), // Add border styling
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 22, 74, 204).withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.network(
                  "https://149789576.v2.pressablecdn.com/wp-content/uploads/2022/02/appointment.png"),
              width: 270,
              height: 190,
            )),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: withWhomController,
              decoration: InputDecoration(
                  labelText: 'Who do you want to make an appointment with?'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: dateTimeController,
              decoration: InputDecoration(labelText: 'Available Date and Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> appointmentInfoMap = {
                  "Your Name": nameController.text,
                  "With Whom": withWhomController.text,
                  "Date and Time": dateTimeController.text,
                };
                await DatabaseMethods().addAppointment(appointmentInfoMap);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Appointment added successfully'),
                ));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
