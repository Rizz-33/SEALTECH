import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealtech/components/theme.dart';

class CartItem extends StatefulWidget {
  final String imageAsset;
  final String productName;
  final String productDescription;
  final double productPrice;
  final Function(int) onQuantityChanged;

  CartItem({
    required this.imageAsset,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.onQuantityChanged,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
    widget.onQuantityChanged(quantity);
  }

  void removeProduct() {
    // TODO: Implement product removal logic
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.productName),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        removeProduct();
      },
      background: Container(
        color: ternaryRed50,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete_outline,
              color: ternaryRed,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              height: 95,
              child: Image.asset(widget.imageAsset, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      widget.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(widget.productDescription),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Price:',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 13),
                          ),
                          TextSpan(
                            text: '${widget.productPrice} LKR',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: decrementQuantity,
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: incrementQuantity,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
