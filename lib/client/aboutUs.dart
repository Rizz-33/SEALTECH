import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late ScrollController _scrollController;
  bool _counterStarted = false;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_startCounter);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_startCounter);
    _scrollController.dispose();
    super.dispose();
  }

  void _startCounter() {
    if (!_counterStarted &&
        _isBoxVisible(
          MediaQuery.of(context).size.height -
              kToolbarHeight -
              kBottomNavigationBarHeight,
        )) {
      setState(() {
        _counterStarted = true;
      });
      _startCounting();
    }
  }

  bool _isBoxVisible(double screenHeight) {
    RenderBox? renderBox =
        context.findRenderObject() as RenderBox; // Find the render object
    double boxPosition = renderBox.localToGlobal(Offset.zero).dy;
    return boxPosition < screenHeight;
  }

  void _startCounting() {
    const countDuration = Duration(seconds: 1);
    const totalCount = 500;
    final interval = countDuration ~/ totalCount;
    int currentCount = 0;

    Timer.periodic(interval, (timer) {
      if (currentCount < totalCount) {
        setState(() {
          _count = currentCount++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Image.asset('lib/images/logoIconBlack.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Text(
                'Waterproof  |  Seal  |  Protection',
                style: TextStyle(color: primaryColor),
                textAlign: TextAlign.left,
              ),
              Text(
                'About Our Company SEALTECH',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
              SizedBox(height: 30,),
              Image.asset('lib/images/aboutus1.png'),
              SizedBox(height: 30,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "At SEALTECH, ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: "we pride ourselves on being a pioneering force in the waterproofing industry, dedicated to delivering top-notch solutions that exceed our clients' expectations. Established in 1995, SEALTECH emerged from humble beginnings with a vision to revolutionize waterproofing practices across residential, commercial, and industrial sectors.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30,),
              Image.asset('lib/images/aboutus2.png'),
              SizedBox(height: 30,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Our journey ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: "began when our founder, John Smith, recognized a critical need for durable, long-lasting waterproofing solutions amidst the burgeoning construction industry. With a relentless pursuit of excellence and a commitment to innovation, SEALTECH quickly gained traction as a trusted name synonymous with quality and reliability.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Over the years, ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: "SEALTECH has evolved into a dynamic team of industry experts, equipped with cutting-edge technology and unmatched expertise to tackle even the most challenging waterproofing projects. Our unwavering dedication to research and development ensures that we stay ahead of the curve, continuously refining our techniques and embracing emerging trends to deliver unparalleled results.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: primary25,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 209, 209, 209).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        _count.toString(),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Projects Done',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: primary50,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: primaryColor,
                            size: 40,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Quality Assurance',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: primaryColor,
                            size: 40,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Customer Satisfaction',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "At SEALTECH, ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: "we understand that each project is unique, requiring tailored solutions to address specific needs and challenges. Our collaborative approach fosters open communication and transparency, allowing us to forge strong partnerships with our clients built on trust, integrity, and mutual respect.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Driven by a passion ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: "for excellence and a commitment to customer satisfaction, SEALTECH remains steadfast in its mission to redefine the standards of waterproofing excellence. With a proven track record of success and a relentless pursuit of perfection, we invite you to join us on our journey as we continue to set new benchmarks and shape the future of waterproofing solutions.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30,),
              Image.asset('lib/images/aboutus3.jpg'),
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(height: 50,),
                  Text('Developed by undergraduate students\nfrom NSBM Green University.'),
                  SizedBox(width: 70,),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.nsbm.ac.lk/');
                    },
                    child: Image.asset('lib/images/nsbmLogo.png', width: 60,),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
