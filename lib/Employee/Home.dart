import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/Employee/Appointment.dart';
import 'package:sealtech/Employee/Attendance.dart';
import 'package:sealtech/Employee/Holidays.dart';
import 'package:sealtech/Employee/Location.dart';
import 'package:sealtech/Employee/SalaryCalculator.dart';
import 'package:sealtech/components/theme.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({
    super.key,
  });

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/images/logo-word-no-background.png',
                  height: 20,
                )
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
        backgroundColor: bgColor,
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 219, 180),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        'Ongoing Locations',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          color: const Color.fromARGB(255, 70, 66, 68),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        'View more site locations \nand get to know the site \nthat completed and \nongoing\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 70, 66, 68),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Location_Page()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 23, 22, 22),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                        ),
                        child: const Text(
                          'View More Details',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'lib/images/home_emp.png',
                          height: 190,
                        ),
                      ],
                    ),
                  ),
                ],
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
                  'Category',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 70, 66, 68),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Holiday_Page()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 241, 192),
                  border: Border.all(
                    color: const Color.fromARGB(255, 248, 241, 192),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 235, 217, 87),
                    ),
                    SizedBox(height: 15),
                    Text('Holidays'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Appoinment_Page()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 241, 192),
                  border: Border.all(
                    color: const Color.fromARGB(255, 248, 241, 192),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_rounded,
                      color: Color.fromARGB(255, 235, 217, 87),
                    ),
                    SizedBox(height: 15),
                    Text('Appointment'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendancePage()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 241, 192),
                  border: Border.all(
                    color: const Color.fromARGB(255, 248, 241, 192),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_view_week,
                      color: Color.fromARGB(255, 235, 217, 87),
                    ),
                    SizedBox(height: 15),
                    Text('Attendance'),
                  ],
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 219, 180),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Salary Calculator',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          color: const Color.fromARGB(255, 70, 66, 68),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        'Let’s calculate your \nsalary by entering details\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 70, 66, 68),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Salary_Page()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 23, 22, 22),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                        ),
                        child: const Text(
                          'Calculate Now',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'lib/images/salary.png',
                          height: 160,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
        ])));
  }
}
