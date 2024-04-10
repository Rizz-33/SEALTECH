import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/components/cardToolChemicals.dart';
import 'package:sealtech/client/components/product.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';

class Chemical extends StatelessWidget {
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
        title: const Text('Chemicals'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/shopping_cart');
            },
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

    List<Product> chemicalProducts = sealTech.allproducts
        .where((product) => product.category == ProductCategory.Chemicals)
        .toList();

    List<Widget> pairs = [];

    for (int i = 0; i < chemicalProducts.length; i += 2) {
      if (i + 1 < chemicalProducts.length) {
        pairs.add(
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: chemicalProducts[i])));
                  },
                  child: ProductPage(
                    imagePath: chemicalProducts[i].imagePath,
                    title: chemicalProducts[i].name,
                    subtitle: 'Chemicals',
                    price: chemicalProducts[i].price.toStringAsFixed(2) + "  LKR",
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: chemicalProducts[i + 1])));
                  },
                  child: ProductPage(
                    imagePath: chemicalProducts[i + 1].imagePath,
                    title: chemicalProducts[i + 1].name,
                    subtitle: 'Chemicals',
                    price: chemicalProducts[i + 1].price.toStringAsFixed(2) + "  LKR",
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => ToolsChemCard(product: chemicalProducts[i])));
            },
            child: ProductPage(
              imagePath: chemicalProducts[i].imagePath,
              title: chemicalProducts[i].name,
              subtitle: 'Chemicals',
              price: chemicalProducts[i].price.toStringAsFixed(2) + "  LKR",
            ),
          ),
        );
      }
    }

    return pairs;
  }
}
