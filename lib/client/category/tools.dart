import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/components/cardToolChemicals.dart';
import 'package:sealtech/client/components/product.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';

class Tool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Tools'),
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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildToolCardPairs(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildToolCardPairs(BuildContext context) {
    final sealTech = Provider.of<SealTech>(context);

    List<Product> toolProducts = sealTech.allproducts
        .where((product) => product.category == ProductCategory.Tools)
        .toList();

    List<Widget> pairs = [];

    for (int i = 0; i < toolProducts.length; i += 2) {
      if (i + 1 < toolProducts.length) {
        pairs.add(
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: toolProducts[i])));
                  },
                  child: ProductPage(
                    imagePath: toolProducts[i].imagePath,
                    title: toolProducts[i].name,
                    subtitle: 'Tools',
                    price: toolProducts[i].price.toStringAsFixed(2) + "  LKR",
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: toolProducts[i + 1])));
                  },
                  child: ProductPage(
                    imagePath: toolProducts[i + 1].imagePath,
                    title: toolProducts[i + 1].name,
                    subtitle: 'Tools',
                    price: toolProducts[i + 1].price.toStringAsFixed(2) + "  LKR",
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        pairs.add(
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: toolProducts[i])));
            },
            child: ProductPage(
              imagePath: toolProducts[i].imagePath,
              title: toolProducts[i].name,
              subtitle: 'Tools',
              price: toolProducts[i].price.toStringAsFixed(2) + "  LKR",
            ),
          ),
        );
      }
    }

    return pairs;
  }
}
