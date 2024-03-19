import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/Employee/Addnewlocation.dart';
import 'package:sealtech/Employee/LocationDetailed1.dart';
import 'package:sealtech/Employee/LocationDetailed2.dart';
import 'package:sealtech/Employee/LocationDetailed3.dart';
import 'package:sealtech/Employee/LocationDetailed4.dart';
import 'package:sealtech/components/theme.dart';

class Location_Page extends StatefulWidget {
  const Location_Page({
    super.key,
  });

  @override
  State<Location_Page> createState() => _Location_PageState();
}

class _Location_PageState extends State<Location_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ongoing Locations',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewLocation_Page()),
                      );
                    },
                    child: Container(
                      width: 85,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primary50,
                        border: Border.all(
                          color: primary50,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 82, 82, 80),
                          ),
                          SizedBox(width: 10),
                          Text('New'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      color: primary25,
                      border: Border.all(
                        color: primary25,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.rotate_left_rounded,
                          color: Color.fromARGB(255, 82, 82, 80),
                        ),
                        SizedBox(width: 10),
                        Text('Ongoing'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      border: Border.all(
                        color: secondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          color: Color.fromARGB(255, 82, 82, 80),
                        ),
                        SizedBox(width: 10),
                        Text('Completed'),
                      ],
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Image.asset(
                          'lib/images/location.png',
                          height: 200,
                        ))
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationDetailed1_Page()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primary25,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primary25),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Swimming Pool Construction',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Deadline : 30th of April 2024',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 96, 94, 94),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Color.fromARGB(255, 59, 57, 57),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationDetailed2_Page()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primary25,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primary25),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Filtering Water',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Deadline : 30th of May 2024',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 96, 94, 94),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Color.fromARGB(255, 59, 57, 57),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationDetailed3_Page()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: secondaryColor),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Leakage Construction',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Deadline : 30th of June 2024',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 96, 94, 94),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Color.fromARGB(255, 59, 57, 57),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationDetailed4_Page()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primary25,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primary25),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chemical adding to Swimming Pool',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Deadline : 30th of April 2024',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 96, 94, 94),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Color.fromARGB(255, 59, 57, 57),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
