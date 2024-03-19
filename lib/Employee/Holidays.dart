import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/theme.dart';

class Holiday_Page extends StatefulWidget {
  const Holiday_Page({
    super.key,
  });

  @override
  State<Holiday_Page> createState() => _Holiday_PageState();
}

class _Holiday_PageState extends State<Holiday_Page> {
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
                  'Holidays',
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
                          child: Image.asset(
                            'lib/images/Holiday.png',
                            height: 200,
                          )),
                    ],
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Moon Poya Day',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                        Text(
                          '20th January 2024',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Moon Poya Day',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                        Text(
                          '20th February 2024',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Easter',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                        Text(
                          '11th March 2024',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'May Day',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                        Text(
                          '1st May 2024',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Moon Poya Day',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                        Text(
                          '20th March 2024',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Moon Poya Day',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                        Text(
                          '20th June 2024',
                          style:
                              TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]))));
  }
}
