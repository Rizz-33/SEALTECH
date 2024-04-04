
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sealtech/client/models/cartItem.dart';
import 'package:sealtech/client/models/productCategories.dart';

class SealTech extends ChangeNotifier{
  final List<Product> _menu = [

  ];
  
  //cart
  final List<CartItem> _cart = [];

  String _deliveryAddress = "239, Colombo";

  List<Product> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  

  //add to cart
  void addToCart(Product product){
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartIem = _cart.firstWhereOrNull((item) {
      //check if the food items are same
      bool isSameProduct = item.product == product;

      return isSameProduct;
    });

    //if the item already exists, increase it's quantity
    if (cartIem != null) {
      cartIem.quantity++;
    } //otherwise add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          product: product,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }
      else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.product.price;

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------------");
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.product.name} - ${_formatPrice(cartItem.product.price)}"
      );
      receipt.writeln();
    }
    receipt.writeln("-----------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)} LKR";
  }
}