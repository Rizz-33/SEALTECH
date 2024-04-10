
import 'package:flutter/material.dart';
import 'package:sealtech/client/models/productCategories.dart';
import 'package:sealtech/components/theme.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Product product;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({super.key, required this.quantity, required this.product, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: primaryColor,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(width: 20, child: Center(child: Text(quantity.toString(),))),
          ),

          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}