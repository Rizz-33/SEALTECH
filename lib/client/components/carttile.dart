import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/components/quantityselector.dart';
import 'package:sealtech/client/models/cartItem.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/components/theme.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  
  const MyCartTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SealTech>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: secondary25,
          borderRadius: BorderRadius.circular(16)
        ),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product image, name, price, and quantity selector
            Row(
              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    cartItem.product.imagePath,
                    height: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11.0, bottom: 8, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.product.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(cartItem.product.category.toString()),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: 'Price: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: '${cartItem.product.price} LKR',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        product: cartItem.product,
                        onIncrement: (){
                          restaurant.addToCart(cartItem.product);
                        },
                        onDecrement: (){
                          restaurant.removeFromCart(cartItem);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
