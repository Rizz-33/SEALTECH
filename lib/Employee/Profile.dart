import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/Employee/Noitification.dart';
import 'package:sealtech/Employee/deleteacc.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/signin.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({
    super.key,
  });

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Profile',
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
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 330,
                        decoration: BoxDecoration(
                          color: secondaryColor, // Set the color to yellow
                          borderRadius:
                              BorderRadius.circular(10), // Set border radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/images/profile.png',
                                height: 60,
                              ),
                              const SizedBox(
                                  width:
                                      40), // Add some space between the image and texts
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jassica',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'jassicafernando@gmail.com',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Image.asset(
                            'lib/images/profile2.png',
                            height: 120,
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Privacy and Security page
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PrivacyPage()),
                      // );
                    },
                    child: Container(
                      width: 310,
                      height: 50,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: primaryColor,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'Privacy and Security',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 84, 82, 82),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 84, 82, 82),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationSettingsPage()),
                      );
                    },
                    child: Container(
                      width: 310,
                      height: 50,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: primaryColor,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'Notification',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 84, 82, 82),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 84, 82, 82),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeleteAccountPage()),
                      );
                    },
                    child: Container(
                      width: 310,
                      height: 50,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: primaryColor,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'Delete my account',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 84, 82, 82),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 84, 82, 82),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Button(
                      buttonText: 'Log Out',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (SignInPage())),
                        );
                      },
                      color: 'orange',
                      enableIcon: false,
                      isStroked: false,
                    ),
                  ),
                  const SizedBox(height: 20),
                ]))));
  }
}
