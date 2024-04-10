import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/cart/payment.dart';
import 'package:sealtech/client/components/carttile.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SealTech>(
      builder: (context, sealtech, child) {
        final userCart = sealtech.cart;

        double subtotal = 0.0;
        for (final cartItem in userCart) {
          subtotal += cartItem.product.price * cartItem.quantity;
        }

        double deliveryFee = 200.0;
        double discount = 0.0;
        double totalPrice = subtotal + deliveryFee - discount;

        return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text('Cart'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Are you sure you want to clear the cart?",
                        style: TextStyle(fontSize: 20),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: accentColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            sealtech.clearCart();
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(color: accentColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                userCart.isEmpty
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: Text(
                            "Cart is empty.",
                            style: TextStyle(color: accent50),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = userCart[index];
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sub Total',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('${subtotal.toStringAsFixed(2)} LKR'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Delivery Fee',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('${deliveryFee.toStringAsFixed(2)} LKR'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Discount',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('${discount.toStringAsFixed(2)} LKR', style: TextStyle(color: Colors.grey[600])),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Total Price',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('${totalPrice.toStringAsFixed(2)} LKR', style: TextStyle(fontWeight: FontWeight.w700, color: primaryColor, fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Button(
                  buttonText: 'Proceed to Checkout',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentPage()),
                  ),
                  color: 'orange',
                  enableIcon: true,
                  width: 380,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
