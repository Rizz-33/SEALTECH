import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sealtech/client/components/cardToolChemicals.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';
import 'package:sealtech/components/theme.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SealTech _sealTech = SealTech();

  List<Product> filteredProducts = [];
  List<String> displayedProductNames = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    filteredProducts = _sealTech.allproducts;
    displayedProductNames = getRandomProductNames();
    super.initState();
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = _sealTech.allproducts;
      } else {
        filteredProducts = _sealTech.allproducts
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void clearSearch() {
    _searchController.clear();
    filterProducts('');
  }

  List<String> getRandomProductNames() {
    List<Product> shuffledProducts = List.from(filteredProducts)..shuffle();
    List<String> randomProductNames = shuffledProducts
        .sublist(0, min(5, shuffledProducts.length))
        .map((product) => product.name)
        .toList();
    return randomProductNames;
  }

  void removeProductFromDisplay(String productName) {
    setState(() {
      displayedProductNames.remove(productName);
    });
  }

  void removeAllProductsFromDisplay() {
    setState(() {
      displayedProductNames.clear();
    });
  }

  void showAllProducts() {
    setState(() {
      displayedProductNames = filteredProducts.map((product) => product.name).toList();
    });
  }

  void navigateToProductDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ToolsChemCard(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Image.asset(
            'lib/images/logo-word-no-background.png',
            width: 160,
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                cursorColor: accent75,
                onChanged: filterProducts,
                decoration: InputDecoration(
                  hintText: 'Search by Names or Descriptions',
                  hintStyle: const TextStyle(fontSize: 14),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: clearSearch,
                        )
                      : null,
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
            const SizedBox(
              height: 16,
            ),
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
                  onTap: displayedProductNames.length != filteredProducts.length
                      ? showAllProducts
                      : removeAllProductsFromDisplay,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      displayedProductNames.length != filteredProducts.length
                          ? 'Show All'
                          : 'Clear All',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayedProductNames.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: GestureDetector(
                        onTap: () => navigateToProductDetails(
                          filteredProducts.firstWhere(
                            (product) => product.name == displayedProductNames[index],
                          ),
                        ),
                        child: Text(
                          displayedProductNames[index],
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      onPressed: () {
                        removeProductFromDisplay(displayedProductNames[index]);
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => navigateToProductDetails(product),
                    title: Text(product.name),
                    trailing: Text('${product.price} LKR'),
                    leading: Image.asset(product.imagePath),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
