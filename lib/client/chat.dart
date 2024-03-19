import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class Chat extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Chat'),
          actions: [
            IconButton(
              icon: Image.asset('lib/images/logoIconBlack.png'),
              onPressed: () {},
            ),
          ]
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 100, color: primaryColor,),
                      const SizedBox(height: 8.0),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'aarruwanthie@gmail.com',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 36.0),
                      
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 172, 172, 172).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 50,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: accent75,
                  decoration: InputDecoration(
                    hintText: 'Message SEALTECH...',
                    filled: true,
                    fillColor: secondaryColor,
                    contentPadding: EdgeInsets.fromLTRB(24.0, 6.0, 12.0, 6.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
