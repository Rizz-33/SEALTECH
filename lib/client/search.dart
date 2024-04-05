import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/client/components/product.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<ProductPage> products = [
    const ProductPage(
        imagePath: 'lib/images/Pool Waterproofing.jpeg',
        title: 'Pool Waterproofing',
        subtitle: 'Service',
        price: '3 million LKR +'),
    const ProductPage(
        imagePath: 'lib/images/Roof Waterproofing.jpeg',
        title: 'Roof Waterproofing',
        subtitle: 'Service',
        price: '1 million LKR +'),
    const ProductPage(
        imagePath: 'lib/images/Basement Sealing.jpeg',
        title: 'Basement Sealing',
        subtitle: 'Service',
        price: '1.5 million LKR +'),
    const ProductPage(
        imagePath: 'lib/images/Side walls Sealing.jpeg',
        title: 'Side walls Sealing',
        subtitle: 'Service',
        price: '2 million LKR +'),
    const ProductPage(
        imagePath: 'lib/images/Concrete Sealing.jpeg',
        title: 'Concrete Sealing',
        subtitle: 'Service',
        price: '1 million LKR +'),
    const ProductPage(
        imagePath: 'lib/images/Drill Machine.jpeg',
        title: 'Drill Machine',
        subtitle: 'Tool',
        price: '9 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Screwdriver Set.jpg',
        title: 'Screwdriver Set',
        subtitle: 'Tool',
        price: '12 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Circular Saw.jpeg',
        title: 'Circular Saw',
        subtitle: 'Tool',
        price: '5 000 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Adjustable Wrench.jpg',
        title: 'Adjustable Wrench',
        subtitle: 'Tool',
        price: '7 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Pipe Wrench.jpeg',
        title: 'Pipe Wrench',
        subtitle: 'Tool',
        price: '3 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Wood Protector.jpeg',
        title: 'Wood Protector',
        subtitle: 'Chemical',
        price: '9 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Waterproof Sealant.png',
        title: 'Waterproof Sealant',
        subtitle: 'Chemical',
        price: '12 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Surface Cleaner.jpeg',
        title: 'Surface Cleaner',
        subtitle: 'Chemical',
        price: '5 000 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Mold Inhibitor Spray.jpeg',
        title: 'Mold Inhibitor Spray',
        subtitle: 'Chemical',
        price: '7 500 LKR'),
    const ProductPage(
        imagePath: 'lib/images/Wood Protector.jpeg',
        title: 'Wood Protector',
        subtitle: 'Chemical',
        price: '9 500 LKR'),
  ];

  List<ProductPage> filteredProducts = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    filteredProducts = products;
    super.initState();
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()) ||
                product.subtitle.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void clearSearch() {
    _searchController.clear();
    filterProducts('');
  }

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
          mainAxisSize:
              MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                cursorColor: accent75,
                onChanged: filterProducts,
                decoration: InputDecoration(
                  hintText: 'Search by Names, Categories or Keywords',
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
                  onTap: isCleared ? showAllRows : removeAllRows,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      isCleared ? 'Show All' : 'Clear All',
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
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      onPressed: () {
                        removeRow(index);
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
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.subtitle),
                  trailing: Text(product.price),
                  leading: Image.asset(product.imagePath),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
