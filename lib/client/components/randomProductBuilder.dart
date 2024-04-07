import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sealtech/client/components/cardToolChemicals.dart';
import 'package:sealtech/client/components/product.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';

class RandomProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildRandomProductCards(context),
      ),
    );
  }

  List<Widget> _buildRandomProductCards(BuildContext context) {
    final List<Product> randomProducts = _getRandomProducts(5);
    return randomProducts.map((product) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: _buildProductCard(context, product),
      );
    }).toList();
  }

  List<Product> _getRandomProducts(int count) {
    final List<Product> allProducts = SealTech().allproducts;
    final List<Product> randomProducts = [];

    final random = Random();
    while (randomProducts.length < count) {
      final int index = random.nextInt(allProducts.length);
      if (!randomProducts.contains(allProducts[index])) {
        randomProducts.add(allProducts[index]);
      }
    }
    return randomProducts;
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToolsChemCard(product: product),
          ),
        );
      },
      child: ProductPage(
        imagePath: product.imagePath,
        title: product.name,
        subtitle: _getCategoryString(product.category),
        price: _getFormattedPrice(product),
      ),
    );
  }

  String _getCategoryString(ProductCategory category) {
    switch (category) {
      case ProductCategory.Services:
        return 'Services';
      case ProductCategory.Tools:
        return 'Tools';
      case ProductCategory.Chemicals:
        return 'Chemicals';
      default:
        return 'Unknown';
    }
  }

  String _getFormattedPrice(Product product) {
    if (product.category == ProductCategory.Services) {
      // Price in million LKR for services
      return '${(product.price).toStringAsFixed(2)} million LKR';
    } else {
      // Price in LKR for other categories
      return '${product.price.toStringAsFixed(2)} LKR';
    }
  }
}
