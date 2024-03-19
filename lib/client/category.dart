import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/client/chat.dart';
import 'package:sealtech/client/chemicals.dart';
import 'package:sealtech/client/product.dart';
import 'package:sealtech/client/services.dart';
import 'package:sealtech/client/tools.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class Category extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text('Category'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('lib/images/logoIconBlack.png'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 18,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Service()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'lib/images/catServiceImage.png',
                                height: 287,
                                width: 180,
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Services',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Contact SEALTECH\nfor unbeatable\nwaterproofing solutions',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Button(
                                      buttonText: 'Contact Us',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Chat()),
                                        );
                                      },
                                      width: 150,
                                      isStroked: true,
                                      color: 'white',
                                    ),
                                    const SizedBox(height: 16,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Tool()),
                            );
                          },
                          child: Container(
                            height: 130,
                            width: 180,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'lib/images/catToolsImage.png',
                                  fit: BoxFit.cover,
                                ),
                                const Positioned(
                                  bottom: 16,
                                  left: 16,
                                  child: Text(
                                    'Tools',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Chemical()),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'lib/images/catChemicalsImage.png',
                                height: 130,
                                width: 180,
                              ),
                              const Positioned(
                                bottom: 16,
                                left: 16,
                                child: Text(
                                  'Chemicals',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Service', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
                ),
                const SizedBox(height: 5,),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 6),
                  child: Row(
                    children: [
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Tools', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
                ),
                const SizedBox(height: 5,),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 6),
                  child: Row(
                    children: [
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Chemicals', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
                ),
                const SizedBox(height: 5,),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 6),
                  child: Row(
                    children: [
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}