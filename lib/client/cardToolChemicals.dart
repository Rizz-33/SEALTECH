import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/client/models/productCategories.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class ToolsChemCard extends StatelessWidget {
  final Product product;

  const ToolsChemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('lib/images/logoIconBlack.png'),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          _addToCart(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                    product.imagePath,
                    height: 200,
                  ),
              SizedBox(height: 30,),
              Text(
                product.name,
                style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
              ),
              SizedBox(height: 6,),
              Text(
                '${_getCategoryString(product.category)}',
                style: TextStyle(color: accentColor),
              ),
              SizedBox(height: 16),
              Text(
                product.description,
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Price: ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${_formatPrice(product.price)}',
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Button(
                buttonText: 'Add to Cart',
                onPressed: () {
                  _addToCart(context);
                },
                width: 380,
                isStroked: false,
                color: 'orange',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    final sealTech = Provider.of<SealTech>(context, listen: false);
    sealTech.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)} LKR";
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
}
