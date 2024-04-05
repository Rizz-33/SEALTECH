import 'package:flutter/material.dart';
import 'package:sealtech/client/cardToolChemicals.dart';
import 'package:sealtech/client/chemicals.dart';
import 'package:sealtech/client/contact%20us/contactUs.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';
import 'package:sealtech/client/product.dart';
import 'package:sealtech/client/services.dart';
import 'package:sealtech/client/tools.dart';
import 'package:sealtech/components/button.dart'; // Import the ProductPage widget

class Category extends StatelessWidget {
  final SealTech sealTech = SealTech(); // Initialize your SealTech class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
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
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ContactUsPage()),
                                        );
                                      },
                                      width: 150,
                                      isStroked: true,
                                      color: 'white',
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                MaterialPageRoute(
                                    builder: (context) => Chemical()),
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
                    ),
                  ],
                ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              "Services",
              sealTech.allproducts.where((product) => product.category == ProductCategory.Services).toList(),
            ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              "Tools",
              sealTech.allproducts.where((product) => product.category == ProductCategory.Tools).toList(),
            ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              "Chemicals",
              sealTech.allproducts.where((product) => product.category == ProductCategory.Chemicals).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategorySection(BuildContext context, String categoryTitle, List<Product> categoryItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            categoryTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 6),
          child: Row(
            children: [
              for (final item in categoryItems)
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: item,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProductPage(
                      imagePath: item.imagePath,
                      title: item.name,
                      subtitle: categoryTitle,
                      price: categoryTitle == "Services" ? '${(item.price).toStringAsFixed(2)} million LKR +' : '${item.price.toStringAsFixed(2)} LKR',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
