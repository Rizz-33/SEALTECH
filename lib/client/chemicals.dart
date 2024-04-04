import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';
import 'package:sealtech/client/product.dart';

class Chemical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Chemicals'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to shopping cart page
              Navigator.pushNamed(context, '/shopping_cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildChemicalCardPairs(context),
              ),
            ),
          ),
        ),
      ),

    );
  }

  List<Widget> _buildChemicalCardPairs(BuildContext context) {
    final sealTech = Provider.of<SealTech>(context);

    // Filter products by category "Chemicals"
    List<Product> chemicalProducts = sealTech.allproducts
        .where((product) => product.category == ProductCategory.Chemicals)
        .toList();

    List<Widget> pairs = [];

    // Loop through chemicalProducts in pairs
    for (int i = 0; i < chemicalProducts.length; i += 2) {
      // Check if there are at least two products left
      if (i + 1 < chemicalProducts.length) {
        // Create a row with two chemical cards
        pairs.add(
          Row(
            children: [
              Expanded(
                child: ProductPage(
                  imagePath: chemicalProducts[i].imagePath,
                  title: chemicalProducts[i].name,
                  subtitle: 'Chemicals',
                  price: chemicalProducts[i].price.toString(),
                ),
              ),
              Expanded(
                child: ProductPage(
                  imagePath: chemicalProducts[i + 1].imagePath,
                  title: chemicalProducts[i + 1].name,
                  subtitle: 'Chemicals',
                  price: chemicalProducts[i + 1].price.toString(),
                ),
              ),
            ],
          ),
        );
      } else {
        // Create a row with only one chemical card
        pairs.add(
          ProductPage(
            imagePath: chemicalProducts[i].imagePath,
            title: chemicalProducts[i].name,
            subtitle: 'Chemicals',
            price: chemicalProducts[i].price.toString(),
          ),
        );
      }
    }

    return pairs;
  }
}
