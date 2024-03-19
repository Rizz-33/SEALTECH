import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/theme.dart';

class LocationDetailed1_Page extends StatefulWidget {
  const LocationDetailed1_Page({
    super.key,
  });

  @override
  State<LocationDetailed1_Page> createState() => _LocationDetailed1_PageState();
}

class _LocationDetailed1_PageState extends State<LocationDetailed1_Page> {
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
                child: Column(children: [
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          'Swimming Pool Construction',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 70, 66, 68),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Image.asset(
                            'lib/images/Locationdetailed.png',
                            height: 200,
                          )),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 219, 180),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Color.fromARGB(255, 59, 57, 57),
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  'Deadline : 30th of April 2024',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 96, 94, 94),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Color.fromARGB(255, 59, 57, 57),
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  'No 230/A, Park Road, Colombo',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 96, 94, 94),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.construction,
                                    color: Color.fromARGB(255, 59, 57, 57),
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  'Swimming Pool Construction',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 96, 94, 94),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.wallet,
                                    color: Color.fromARGB(255, 59, 57, 57),
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(width: 35),
                              Expanded(
                                child: Text(
                                  'Due Payment',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 96, 94, 94),
                                  ),
                                ),
                              ),
                            ],
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
                          'Progress',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
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
                        MyCheckBoxContainer(title: 'Give Quatation'),
                        const SizedBox(height: 10),
                        MyCheckBoxContainer(title: 'Start Work'),
                        const SizedBox(height: 10),
                        MyCheckBoxContainer(title: 'Completion'),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ]))));
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
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
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
                      ? primaryColor
                      : const Color.fromRGBO(255, 132, 0, 1),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: isChecked
                    ? primaryColor
                    : const Color.fromRGBO(255, 252, 245, 1),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15.0,
                      )
                    : null,
              ),
            ),
            //
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
