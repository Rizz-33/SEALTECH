import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/client/chat.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class ServiceCard extends StatefulWidget {
  ServiceCard({Key? key}) : super(key: key);

  @override
  ServiceCardState createState() => ServiceCardState();
}

class ServiceCardState extends State<ServiceCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Product Info'),
          actions: [
            IconButton(
              icon: Image.asset('lib/images/logoIconBlack.png'),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 16,),
              Container(
                height: 250,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    Image.asset('lib/images/proInfo.png'),
                    Image.asset('lib/images/proInfo.png'),
                    Image.asset('lib/images/proInfo.png'),
                    Image.asset('lib/images/proInfo.png'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              DotsIndicator(
                dotsCount: 4,
                position: _currentPage,
                decorator: DotsDecorator(
                  activeColor: accent50,
                  activeSize: const Size(48, 9),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  spacing: const EdgeInsets.all(4),
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Swimming Pool (8ft)',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Services',
                      style: TextStyle(
                        color: accentColor,
                      ),
                    ),
                    
                    SizedBox(height: 10,),
                    Text('Lorem ipsum dolor sit amet consectetur. Risus sed et cras sit orci erat. Tortor eu nibh in amet tempor sapien. Et justo egestas leo consequat quis ipsum. Praesent bibendum aliquet massa at dignissim lacus lobortis quisque aliquam.\n\nTortor eu nibh in amet tempor sapien. Et justo egestas leo consequat quis ipsum. Praesent bibendum aliquet massa at dignissim lacus lobortis quisque aliquam.'),
                    SizedBox(height: 32,),
                    RichText(
                      text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Est. Price:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: 20,)),
                        TextSpan(
                          text: '2 million LKR +',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 16,),
                    Button(
                      buttonText: 'Contact Us',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chat()),
                        );
                      },
                      width: 380,
                      isStroked: false,
                      color: 'orange',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}