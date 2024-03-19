import 'package:flutter/material.dart';
import 'package:sealtech/client/product.dart';

class Tool extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Tools'),
          actions: [
            IconButton(
              icon: Image.asset('lib/images/logoIconBlack.png'),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                      ProductPage(imagePath: 'lib/images/pro1.png', title: 'Swimming Pool\n(8ft)', subtitle: 'Service', price: '2 million LKR +'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
