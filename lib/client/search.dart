import 'package:flutter/material.dart';
import 'package:sealtech/client/product.dart';
import 'package:sealtech/components/theme.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> additionalRows = [
    'Additional Row 1',
    'Additional Row 2',
    'Additional Row 3',
    'Additional Row 4',
    'Additional Row 5',
  ];

  List<String> originalRows = [
    'Additional Row 1',
    'Additional Row 2',
    'Additional Row 3',
    'Additional Row 4',
    'Additional Row 5',
  ];

  bool isCleared = false;

  void removeRow(int index) {
    setState(() {
      additionalRows.removeAt(index);
    });
  }

  void removeAllRows() {
    setState(() {
      additionalRows.clear();
      isCleared = true;
    });
  }

  void showAllRows() {
    setState(() {
      additionalRows = List.from(originalRows);
      isCleared = false;
    });
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
            child: Image.asset('lib/images/logo-word-no-background.png', width: 160,),
          ),
          backgroundColor: bgColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  cursorColor: accent75,
                  decoration: InputDecoration(
                    hintText: 'Search by Names, Categories or Keywords',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: secondaryColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Popular Searches',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: isCleared ? showAllRows : removeAllRows,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        isCleared ? 'Show All' : 'Clear All',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: additionalRows.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          additionalRows[index],
                          textAlign: TextAlign.left,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 18,),
                        onPressed: () {
                          removeRow(index);
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16,),
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
      );
}