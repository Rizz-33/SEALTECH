import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/client/chat.dart';
import 'package:sealtech/client/chemicals.dart';
import 'package:sealtech/client/feedback.dart';
import 'package:sealtech/client/product.dart';
import 'package:sealtech/client/services.dart';
import 'package:sealtech/client/tools.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
            child: Image.asset('lib/images/logo-word-no-background.png', width: 160,),
          ),
          backgroundColor: primary75,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/home_client.png',),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 8,),
                        Text(
                          'Discover Unrivaled\nWaterproofing Services\nwith SealTech!',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Button(
                          buttonText: 'More',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Chat()),
                            );
                          },
                          enableIcon: true,
                          color: 'black',
                          isStroked: true,
                          width: 150,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Popular',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      const TextSpan(
                        text: ' Services and Essentials',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
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
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Category', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Service()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.275,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        color: primary25,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/images/catService.png'),
                          const SizedBox(height: 5,),
                          const Text('Services'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tool()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.275,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        color: primary25,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/images/catTools.png'),
                          const SizedBox(height: 5,),
                          const Text('Tools'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chemical()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.275,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        color: primary25,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/images/catChemicals.png'),
                          const SizedBox(height: 5,),
                          const Text('Chemicals'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Featured',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      const TextSpan(
                        text: ' Services and Essentials',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 6),
                child: Row(
                  children: [
                    ProductPage(imagePath: 'lib/images/pro1.png', title: 'Waterproofing\nSolution', subtitle: 'Product', price: '1 million LKR +'),
                    ProductPage(imagePath: 'lib/images/pro1.png', title: 'Waterproofing\nSolution', subtitle: 'Product', price: '1 million LKR +'),
                    ProductPage(imagePath: 'lib/images/pro1.png', title: 'Waterproofing\nSolution', subtitle: 'Product', price: '1 million LKR +'),
                    ProductPage(imagePath: 'lib/images/pro1.png', title: 'Waterproofing\nSolution', subtitle: 'Product', price: '1 million LKR +'),
                    ProductPage(imagePath: 'lib/images/pro1.png', title: 'Waterproofing\nSolution', subtitle: 'Product', price: '1 million LKR +'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Feedback', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
              ),
              const SizedBox(height: 10),
              FeedbackTemplate(
                title: 'Name',
                additionalText: 'Feedback [comment]',
                stars: [Icons.star, Icons.star, Icons.star, Icons.star_half,Icons.star_border],
                comment: 'Your comment',
              ),
              const SizedBox(height: 16,),
              FeedbackTemplate(
                title: 'Name',
                additionalText: 'Feedback [comment]',
                stars: [Icons.star, Icons.star, Icons.star, Icons.star_half,Icons.star_border],
                comment: 'Your comment',
              )
            ],
          ),
        ),
      );
}
