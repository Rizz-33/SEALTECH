import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sealtech/client/models/cartItem.dart';
import 'package:sealtech/client/models/productCategories.dart';

class SealTech extends ChangeNotifier {
  final List<Product> _allproducts = [
    Product(
      imagePath: 'lib/images/Pool Waterproofing.jpeg',
      name: 'Pool Waterproofing',
      description: 'Ensure a pristine swimming environment with our advanced pool waterproofing solutions, providing long-lasting protection against leaks and water damage, ensuring durability and safety for your pool area.',
      category: ProductCategory.Services,
      price: 3,
    ),
    Product(
      imagePath: 'lib/images/Roof Waterproofing.jpeg',
      name: 'Roof Waterproofing',
      category: ProductCategory.Services,
      description: 'Extend the lifespan of your roof with our professional waterproofing services, guarding against moisture intrusion and weathering, ensuring a dry and secure interior environment for your property.',
      price: 1,
    ),
    Product(
      imagePath: 'lib/images/Basement Sealing.jpeg',
      name: 'Basement Sealing',
      category: ProductCategory.Services,
      description: 'Keep your basement dry and mold-free with our expert sealing solutions, preventing water intrusion and enhancing structural integrity, creating a comfortable and healthy living space for your home.',
      price: 1.5,
    ),
    Product(
      imagePath: 'lib/images/Side walls Sealing.jpeg',
      name: 'Side walls Sealing',
      category: ProductCategory.Services,
      description: "Protect your property's exterior walls from moisture and erosion with our specialized sealing services, ensuring durability and maintaining the aesthetic appeal of your building for years to come.",
      price: 2,
    ),
    Product(
      imagePath: 'lib/images/Concrete Sealing.jpeg',
      name: 'Concrete Sealing',
      category: ProductCategory.Services,
      description: "Preserve the strength and appearance of your concrete surfaces with our high-performance sealing products, guarding against cracks, stains, and deterioration, ensuring long-term durability and aesthetic appeal.",
      price: 1,
    ),
    Product(
      imagePath: 'lib/images/Drill Machine.jpeg',
      name: 'Drill Machine',
      category: ProductCategory.Tools,
      description: 'Empower your projects with our versatile drill machine, delivering powerful performance and precision for various drilling tasks, making it an essential tool for construction, woodworking, and DIY enthusiasts.',
      price: 9500,
    ),
    Product(
      imagePath: 'lib/images/Screwdriver Set.jpg',
      name: 'Screwdriver Set',
      category: ProductCategory.Tools,
      description: 'Complete your toolkit with our comprehensive screwdriver set, featuring a range of sizes and types for effortless fastening and assembly work, ensuring convenience and efficiency in every project.',
      price: 12500,
    ),
    Product(
      imagePath: 'lib/images/Circular Saw.jpeg',
      name: 'Circular Saw',
      category: ProductCategory.Tools,
      description: 'Achieve professional-grade cuts with our precision circular saw, designed for accuracy and efficiency in woodworking, carpentry, and renovation projects, making it an indispensable tool for craftsmen and contractors alike.',
      price: 5000,
    ),
    Product(
      imagePath: 'lib/images/Adjustable Wrench.jpg',
      name: 'Adjustable Wrench',
      category: ProductCategory.Tools,
      description: 'Simplify plumbing and mechanical tasks with our adjustable wrench, offering a secure grip and customizable jaw width for versatile use in tight spaces, ensuring ease of use and reliability in every application.',
      price: 7500,
    ),
    Product(
      imagePath: 'lib/images/Pipe Wrench.jpeg',
      name: 'Pipe Wrench',
      category: ProductCategory.Tools,
      description: 'Handle pipe installations and repairs with ease using our durable pipe wrench, providing reliable grip and leverage for secure tightening and loosening, making it an essential tool for plumbers and mechanics.',
      price: 3500,
    ),
    Product(
      imagePath: 'lib/images/Wood Protector.jpeg',
      name: 'Wood Protector',
      category: ProductCategory.Chemicals,
      description: 'Preserve the beauty and integrity of your wood surfaces with our specialized protector, offering enhanced resistance to moisture, UV rays, and other environmental factors, ensuring long-lasting protection and beauty for your outdoor furniture and structures.',
      price: 9500,
    ),
    Product(
      imagePath: 'lib/images/Waterproof Sealant.png',
      name: 'Waterproof Sealant',
      category: ProductCategory.Chemicals,
      description: 'Safeguard various surfaces from water damage and corrosion with our premium sealant, providing long-lasting protection and flexibility for indoor and outdoor applications, ensuring peace of mind and durability for your projects.',
      price: 12500,
    ),
    Product(
      imagePath: 'lib/images/Surface Cleaner.jpeg',
      name: 'Surface Cleaner',
      category: ProductCategory.Chemicals,
      description: 'Maintain cleanliness and hygiene with our effective surface cleaner, eliminating dirt, grime, and stains without harming the surface or leaving residue behind, ensuring a spotless and inviting environment for your home or business.',
      price: 5000,
    ),
    Product(
      imagePath: 'lib/images/Mold Inhibitor Spray.jpeg',
      name: 'Mold Inhibitor Spray',
      category: ProductCategory.Chemicals,
      description: 'Combat mold and mildew growth with our powerful inhibitor spray, preventing health hazards and property damage associated with fungal infestations, ensuring a safe and healthy indoor environment for you and your family.',
      price: 7500,
    ),
    Product(
      imagePath: 'lib/images/Rust Remover.png',
      name: 'Rust Remover',
      category: ProductCategory.Chemicals,
      description: 'Effectively eliminate rust and corrosion from metal surfaces with our advanced rust remover, restoring the appearance and integrity of your equipment, tools, and fixtures, ensuring prolonged lifespan and optimal performance for your belongings.',
      price: 8500,
    ),
  ];

  final List<CartItem> _cart = [];
  String _deliveryAddress = "239, Colombo";

  List<Product> get allproducts => _allproducts;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  void addToCart(Product product) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) => item.product == product);

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.product.price;

      total += itemTotal * cartItem.quantity + 200;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();
    String formattedDate = DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------------");
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.product.name} - ${_formatPrice(cartItem.product.price)}");
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

  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)} LKR";
  }

  String formatPrice(double price) {
    return _formatPrice(price);
  }
}
