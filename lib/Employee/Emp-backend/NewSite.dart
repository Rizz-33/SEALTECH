import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import 'package:sealtech/Employee/Emp-backend/appoinment.dart';
import 'package:sealtech/Employee/Emp-backend/service/database.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'New Site',
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Image.asset(
                        'lib/images/location.png',
                        height: 200,
                      ))),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                  controller: addressController,
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
              SizedBox(height: 30.0),
              Center(
                child: Button(
                  onPressed: () async {
                    String Id = randomAlphaNumeric(10);
                    String name = nameController.text;
                    String deadline = deadlineController.text;
                    String address = addressController.text;

                    if (name.isNotEmpty &&
                        deadline.isNotEmpty &&
                        address.isNotEmpty) {
                      Map<String, dynamic> employeeInfoMap = {
                        "Name": name,
                        "Deadline": deadline,
                        "Id": Id,
                        "Address": address,
                      };

                      try {
                        await DatabaseMethods()
                            .addEmployeeDetails(employeeInfoMap, Id);
                        Fluttertoast.showToast(
                          msg: "Details added successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } catch (e) {
                        print("Error adding employee details: $e");
                        Fluttertoast.showToast(
                          msg: "Failed to add details. Please try again later.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: "Please fill in all fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  buttonText: 'Submit',
                ),
              ),
              SizedBox(height: 30.0),
              Dismissible(
                key: Key('appointment_card'),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  // Navigate to another page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => appointmentp()),
                  );
                },
                background: Container(
                  color: const Color.fromARGB(255, 176, 237, 178),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  alignment: Alignment.centerLeft,
                  child: const Icon(Icons.arrow_forward),
                ),
                child: const Card(
                  elevation: 5,
                  color: Color.fromARGB(255, 252, 211, 146),
                  child: ListTile(
                    title: Text('Appointments'),
                    subtitle: Text('Slide right to view appointments'),
                    leading: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
