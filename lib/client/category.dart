import 'package:flutter/material.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';


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
                    // Handle item tap
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          item.imagePath,
                          height: 120,
                          width: 120,
                        ),
                        Text(item.name),
                      ],
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
