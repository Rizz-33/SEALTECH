
import 'package:sealtech/client/models/productCategories.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice {
    return (product.price) * quantity;
  }
}