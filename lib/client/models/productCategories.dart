
class Product {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final ProductCategory category;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
  });
}


enum ProductCategory {
  Services,
  Tools,
  Chemicals,
}
