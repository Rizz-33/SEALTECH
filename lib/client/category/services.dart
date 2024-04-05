import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/cardToolChemicals.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';
import 'package:sealtech/client/product.dart';

class Service extends StatelessWidget {
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
        title: Text('Services'),
        actions: [
          IconButton(
            icon: Image.asset('lib/images/logoIconBlack.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildServiceCardPairs(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildServiceCardPairs(BuildContext context) {
    final sealTech = Provider.of<SealTech>(context);

    // Filter products by category "Services"
    List<Product> serviceProducts = sealTech.allproducts
        .where((product) => product.category == ProductCategory.Services)
        .toList();

    List<Widget> pairs = [];

    // Loop through serviceProducts in pairs
    for (int i = 0; i < serviceProducts.length; i += 2) {
      // Check if there are at least two products left
      if (i + 1 < serviceProducts.length) {
        // Create a row with two service cards
        pairs.add(
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: serviceProducts[i])));
                  },
                  child: ProductPage(
                    imagePath: serviceProducts[i].imagePath,
                    title: serviceProducts[i].name,
                    subtitle: 'Services',
                    price: serviceProducts[i].price.toStringAsFixed(2) + '  million LKR +',
                  ),
                ),
              ),
              SizedBox(width: 20), // Add spacing between cards
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: serviceProducts[i + 1])));
                  },
                  child: ProductPage(
                    imagePath: serviceProducts[i + 1].imagePath,
                    title: serviceProducts[i + 1].name,
                    subtitle: 'Services',
                    price: serviceProducts[i + 1].price.toStringAsFixed(2) + '  million LKR +',
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        // Create a row with only one service card
        pairs.add(
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: serviceProducts[i])));
            },
            child: ProductPage(
              imagePath: serviceProducts[i].imagePath,
              title: serviceProducts[i].name,
              subtitle: 'Services',
              price: serviceProducts[i].price.toStringAsFixed(2) + '  million LKR +',
            ),
          ),
        );
      }
    }

    return pairs;
  }
}
