// import 'package:blend_bristo/models/cartitem.dart';
// import 'package:blend_bristo/models/food.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class Restaurant extends ChangeNotifier{
//   final List<Food> _menu = [

//     //coffee
//     Food(
//       name: "Macchiato",
//       description: "Indulge in the perfect harmony of bold espresso and velvety steamed milk, meticulously crafted to elevate your coffee experience.",
//       imagePath: "lib/images/coffee/Macchiato.png",
//       price: 1100,
//       category: FoodCategory.Coffees,
//       availableAddon: [
//         Addon(name: "Caramel Syrup", price: 150),
//         Addon(name: "Whipped Cream", price: 170),
//         Addon(name: "Cocoa Powder", price: 160),
//       ],
//     ),
//     Food(
//       name: "Latte",
//       description: "Savor the smooth sophistication of our signature lattes, expertly brewed to balance the robustness of espresso with the creaminess of steamed milk.",
//       imagePath: "lib/images/coffee/Latte.png",
//       price: 950,
//       category: FoodCategory.Coffees,
//       availableAddon: [
//         Addon(name: "Caramel Syrup", price: 150),
//         Addon(name: "Whipped Cream", price: 170),
//         Addon(name: "Cocoa Powder", price: 160),
//       ]
//     ),
//     Food(
//       name: "Mocha",
//       description: "Dive into a decadent blend of rich espresso, creamy chocolate, and frothy milk, delivering a delightful symphony of flavors with every sip.",
//       imagePath: "lib/images/coffee/Mocha.png",
//       price: 750,
//       category: FoodCategory.Coffees,
//       availableAddon: [
//         Addon(name: "Caramel Syrup", price: 150),
//         Addon(name: "Whipped Cream", price: 170),
//         Addon(name: "Cocoa Powder", price: 160),
//       ]
//     ),
//     Food(
//       name: "Americano",
//       description: "Indulge in the bold simplicity of our Americano, crafted with freshly brewed espresso and hot water, offering a robust and invigorating coffee experience.",
//       imagePath: "lib/images/coffee/Americano.png",
//       price: 950,
//       category: FoodCategory.Coffees,
//       availableAddon: [
//         Addon(name: "Caramel Syrup", price: 150),
//         Addon(name: "Whipped Cream", price: 170),
//         Addon(name: "Cocoa Powder", price: 160),
//       ]
//     ),
//     Food(
//       name: "Cappuccino",
//       description: "Indulge in the perfect harmony of bold espresso, velvety steamed milk, and a cloud-like layer of frothed milk, culminating in a smooth and satisfying coffee experience.",
//       imagePath: "lib/images/coffee/Cappuccino.png",
//       price: 950,
//       category: FoodCategory.Coffees,
//       availableAddon: [
//         Addon(name: "Caramel Syrup", price: 150),
//         Addon(name: "Whipped Cream", price: 170),
//         Addon(name: "Cocoa Powder", price: 160),
//       ]
//     ),

//     //tea
//     Food(
//       name: "Peach Tea",
//       description: "Indulge in a refreshing fusion of ripe peach essence and premium tea, offering a tantalizing harmony of sweetness and natural flavors with each invigorating sip.",
//       imagePath: "lib/images/tea/Peach Tea.png",
//       price: 1100,
//       category: FoodCategory.Teas,
//       availableAddon: [
//         Addon(name: "Honey Drizzle", price: 150),
//         Addon(name: "Lemon Slice", price: 100),
//         Addon(name: "Mint Leaves", price: 120)
//       ]
//     ),
//     Food(
//       name: "Apple Tea",
//       description: "Indulge in a harmonious infusion of crisp apple essence, complemented by fragrant tea leaves, offering a refreshing experience with every sip.",
//       imagePath: "lib/images/tea/Apple Tea.png",
//       price: 1150,
//       category: FoodCategory.Teas,
//       availableAddon: [
//         Addon(name: "Cinnamon Stick", price: 80),
//         Addon(name: "Honey Drizzle", price: 150),
//         Addon(name: "Lemon Slice", price: 100)
//       ]
//     ),
//     Food(
//       name: "Mango Tea",
//       description: "Embark on a refreshing journey with our Mango Tea, crafted with the finest tea leaves infused with the tropical sweetness of ripe mangoes, offering a tantalizing fusion of flavors with each invigorating sip.",
//       imagePath: "lib/images/tea/Mango Tea.png",
//       price: 1000,
//       category: FoodCategory.Teas,
//       availableAddon: [
//         Addon(name: "Honey", price: 150),
//         Addon(name: "Mint Leaves", price: 80),
//         Addon(name: "Lemon Wedge", price: 120),
//       ]
//     ),
//     Food(
//       name: "Iced Tea",
//       description: "Indulge in a refreshing concoction of chilled tea, infused with your choice of fruity flavors, offering a revitalizing experience with every sip.",
//       imagePath: "lib/images/tea/Iced Tea.png",
//       price: 900,
//       category: FoodCategory.Teas,
//       availableAddon: [
//         Addon(name: "Lemon Slice", price: 100),
//         Addon(name: "Mint Leaves", price: 70),
//         Addon(name: "Simple Syrup", price: 80)
//       ]
//     ),
//     Food(
//       name: "Lemon Tea",
//       description: "Refresh your senses with our Lemon Tea, a harmonious infusion of zesty lemon and aromatic tea leaves, creating a revitalizing beverage perfect for any time of the day.",
//       imagePath: "lib/images/tea/Lemon Tea.png",
//       price: 850,
//       category: FoodCategory.Teas,
//       availableAddon: [
//         Addon(name: "Honey", price: 150),
//         Addon(name: "Mint Leaves", price: 80),
//         Addon(name: "Lemon Wedge", price: 120),
//       ]
//     ),
    
//     //wraps
//     Food(
//       name: "Minced Beef Wrap",
//       description: "Savor the rich taste of seasoned minced beef, complemented by crisp veggies and a zesty sauce, all wrapped snugly in a soft tortilla for a flavorful experience.",
//       imagePath: "lib/images/wraps/Minced Beef Wraps.png",
//       price: 840,
//       category: FoodCategory.Wraps,
//       availableAddon: [
//         Addon(name: "Guacamole", price: 180),
//         Addon(name: "Bacon Strips", price: 230),
//         Addon(name: "Jalapeno Slices", price: 150)
//       ]
//     ),
//     Food(
//       name: "Stuffed Seafood Wrap",
//       description: "Indulge in a delectable stuffed seafood wrap featuring a medley of flavorful seafood, crisp veggies, and savory sauce, all enclosed in a soft tortilla, ensuring a delightful taste sensation with every bite.",
//       imagePath: "lib/images/wraps/Stuffed Seafood Wrap.png",
//       price: 790,
//       category: FoodCategory.Wraps,
//       availableAddon: [
//         Addon(name: "Avocado Slices", price: 170),
//         Addon(name: "Crabmeat", price: 210),
//         Addon(name: "Pickled Shrimp", price: 190)
//       ]
//     ),
//     Food(
//       name: "Crispy Chicken Wrap",
//       description: "Experience the perfect blend of succulent crispy chicken, fresh veggies, and zesty sauce, all wrapped snugly in a soft tortilla, delivering a burst of flavor in every bite.",
//       imagePath: "lib/images/wraps/Crispy Chicken Wraps.png",
//       price: 690,
//       category: FoodCategory.Wraps,
//       availableAddon: [
//         Addon(name: "Guacamole", price: 180),
//         Addon(name: "Bacon Strips", price: 230),
//         Addon(name: "Jalapeno Slices", price: 150)
//       ]
//     ),
//     Food(
//       name: "Salmon and Egg Wrap",
//       description: "Dive into a delightful combination of smoked salmon, fluffy scrambled eggs, and crisp lettuce, all carefully enveloped in a soft tortilla, offering a burst of flavors with every mouthful.",
//       imagePath: "lib/images/wraps/Salmon and Egg Wraps.png",
//       price: 630,
//       category: FoodCategory.Wraps,
//       availableAddon: [
//         Addon(name: "Guacamole", price: 180),
//         Addon(name: "Bacon Strips", price: 230),
//         Addon(name: "Jalapeno Slices", price: 150)
//       ]
//     ),
//     Food(
//       name: "Veggie Wrap",
//       description: "Indulge in a delightful combination of fresh vegetables, vibrant flavors, and zesty sauce, all wrapped snugly in a soft tortilla, ensuring a burst of flavor with every bite.",
//       imagePath: "lib/images/wraps/Veggie Wrap.png",
//       price: 590,
//       category: FoodCategory.Wraps,
//       availableAddon: [
//         Addon(name: "Guacamole", price: 180),
//         Addon(name: "Jalapeno Slices", price: 150),
//         Addon(name: "Tomato Salsa", price: 120)
//       ]
//     ),

//     //drinks
//     Food(
//       name: "Strawberry-Banana Smoothie",
//       description: "Savor the luscious blend of ripe strawberries and creamy bananas, expertly crafted into a smooth and refreshing beverage, perfect for a delightful indulgence any time of day.",
//       imagePath: "lib/images/drink/Strawberry-Banana Smoothie.png",
//       price: 890,
//       category: FoodCategory.Drinks,
//       availableAddon: [
//         Addon(name: "Protein Powder", price: 260),
//         Addon(name: "Chia Seeds", price: 120),
//         Addon(name: "Greek Yogurt", price: 230)
//       ]
//     ),
//     Food(
//       name: "Mango-Yourgut Smoothie",
//       description: "Enjoy the tropical goodness of mango blended with the probiotic power of yogurt, creating a creamy and refreshing smoothie that's both delicious and good for your gut.",
//       imagePath: "lib/images/drink/Mango-Yourgut Smoothie.png",
//       price: 890,
//       category: FoodCategory.Drinks,
//       availableAddon: [
//         Addon(name: "Spinach", price: 260),
//         Addon(name: "Chia Seeds", price: 120),
//         Addon(name: "Coconut Flakes", price: 230)
//       ]
//     ),
//     Food(
//       name: "Strawberry Milkshake",
//       description: "Indulge in the creamy sweetness with our classic strawberry milkshake",
//       imagePath: "lib/images/drink/Strawberry Milkshake.png",
//       price: 420,
//       category: FoodCategory.Drinks,
//       availableAddon: [
//         Addon(name: "Whipped Cream", price: 70),
//         Addon(name: "Chocolate Syrup Drizzle", price: 120),
//         Addon(name: "Extra Strawberries", price: 80),
//       ]
//     ),
//     Food(
//       name: "Chocolate Milkshake",
//       description: "Indulge in creamy chocolate goodness with our Chocolate Milkshake.",
//       imagePath: "lib/images/drink/Chocolate Milkshake.png",
//       price: 380,
//       category: FoodCategory.Drinks,
//       availableAddon: [
//         Addon(name: "Whipped Cream", price: 70),
//         Addon(name: "Chocolate Syrup Drizzle", price: 120),
//         Addon(name: "Sprinkles", price: 50)
//       ]
//     ),
//     Food(
//       name: "Vanilla Milkshake",
//       description: "Indulge in the creamy goodness of a classic vanilla milkshake, crafted with the finest ingredients for a rich and satisfying treat.",
//       imagePath: "lib/images/drink/Vanilla Milkshake.png",
//       price: 380,
//       category: FoodCategory.Drinks,
//       availableAddon: [
//         Addon(name: "Sprinkles", price: 120),
//         Addon(name: "Whipped Cream", price: 70),
//         Addon(name: "Cherry on Top", price: 50)
//       ]
//     ),
    
//     //cakes
//     Food(
//       name: "Strawberry Cheesecake",
//       description: "Savor the heavenly delight of our Strawberry Cheesecake, where luscious cheesecake meets a symphony of ripe strawberries atop a delectable graham cracker crust, creating an irresistible dessert experience.",
//       imagePath: "lib/images/cake/Strawberry Cheesecake.png",
//       price: 540,
//       category: FoodCategory.Cakes,
//       availableAddon: [
//         Addon(name: "Extra Strawberry Topping", price: 110),
//         Addon(name: "Whipped Cream", price: 80),
//         Addon(name: "Chocolate Drizzle", price: 90),
//       ]
//     ),
//     Food(
//       name: "Red Velvet Cake",
//       description: "Indulge in the velvety richness of our Red Velvet Cake, where moist layers of crimson-hued cake intertwine with luxurious cream cheese frosting, culminating in a decadent dessert sensation.",
//       imagePath: "lib/images/cake/Red Velvet Cake.png",
//       price: 440,
//       category: FoodCategory.Cakes,
//       availableAddon: [
//         Addon(name: "Cream Cheese Frosting Swirl", price: 110),
//         Addon(name: "White Chocolate Shavings", price: 100),
//         Addon(name: "Raspberry Coulis Drizzle", price: 80),
//       ]
//     ),
//     Food(
//       name: "Chocolate Cake",
//       description: "Dive into pure chocolate ecstasy with our Chocolate Cake, a heavenly creation boasting layers of rich, moist chocolate cake enveloped in smooth, indulgent chocolate frosting, promising a decadent treat for your taste buds.",
//       imagePath: "lib/images/cake/Chocolate Cake.png",
//       price: 320,
//       category: FoodCategory.Cakes,
//       availableAddon: [
//         Addon(name: "Extra Chocolate Ganache", price: 80),
//         Addon(name: "Vanilla Ice Cream Scoop", price: 100),
//         Addon(name: "Caramel Drizzle", price: 80),
//       ]
//     ),
//     Food(
//       name: "Carrot Cake",
//       description: "Discover the timeless indulgence of our Carrot Cake, featuring layers of moist cake infused with aromatic spices and freshly grated carrots, crowned with a luxurious cream cheese frosting, promising a delightfully nostalgic treat for your taste buds.",
//       imagePath: "lib/images/cake/Carrot Cake.png",
//       price: 320,
//       category: FoodCategory.Cakes,
//       availableAddon: [
//         Addon(name: "Walnut Pieces", price: 120),
//         Addon(name: "Raisins", price: 70),
//         Addon(name: "Caramel Drizzle", price: 80),
//       ]
//     ),
//     Food(
//       name: "Organic Coffee Cake",
//       description: "Dive into the rich aroma and irresistible flavor of our Organic Coffee Cake, where every bite is a celebration of buttery goodness infused with the bold essence of freshly brewed coffee, crowned with a heavenly cinnamon streusel topping.",
//       imagePath: "lib/images/cake/Organic Coffee Cake.png",
//       price: 320,
//       category: FoodCategory.Cakes,
//       availableAddon: [
//         Addon(name: "Extra Streusel Topping", price: 150),
//         Addon(name: "Vanilla Glaze", price: 80),
//         Addon(name: "Toasted Almonds", price: 140),
//       ]
//     ),
//   ];
  
//   //cart
//   final List<CartItem> _cart = [];

//   String _deliveryAddress = "389, Kahathuduwa, Gonapola Junction";

//   List<Food> get menu => _menu;
//   List<CartItem> get cart => _cart;
//   String get deliveryAddress => _deliveryAddress;

  

//   //add to cart
//   void addToCart(Food food, List<Addon> selectedAddons){
//     //see if there is a cart item already with the same food and selected addons
//     CartItem? cartIem = _cart.firstWhereOrNull((item) {
//       //check if the food items are same
//       bool isSameFood = item.food == food;

//       //check if the list of selected addons are same
//       bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

//       return isSameFood && isSameAddons;
//     });

//     //if the item already exists, increase it's quantity
//     if (cartIem != null) {
//       cartIem.quantity++;
//     } //otherwise add a new cart item to the cart
//     else {
//       _cart.add(
//         CartItem(
//           food: food,
//           selectedAddons: selectedAddons
//         ),
//       );
//     }
//     notifyListeners();
//   }

//   //remove from cart
//   void removeFromCart(CartItem cartItem) {
//     int cartIndex = _cart.indexOf(cartItem);

//     if (cartIndex != -1) {
//       if (_cart[cartIndex].quantity > 1) {
//         _cart[cartIndex].quantity--;
//       }
//       else {
//         _cart.removeAt(cartIndex);
//       }
//     }
//     notifyListeners();
//   }

//   //get total price of cart
//   double getTotalPrice() {
//     double total = 0.0;

//     for (CartItem cartItem in _cart) {
//       double itemTotal = cartItem.food.price;

//       for (Addon addon in cartItem.selectedAddons) {
//         itemTotal += addon.price;
//       }

//       total += itemTotal * cartItem.quantity;
//     }

//     return total;
//   }

//   //get total number of items in cart
//   int getTotalItemCount() {
//     int totalItemCount = 0;

//     for (CartItem cartItem in _cart) {
//       totalItemCount += cartItem.quantity;
//     }

//     return totalItemCount;
//   }

//   // clear cart
//   void clearCart() {
//     _cart.clear();
//     notifyListeners();
//   }

//   void updateDeliveryAddress(String newAddress) {
//     _deliveryAddress = newAddress;
//     notifyListeners();
//   }

//   //generate a receipt
//   String displayCartReceipt() {
//     final receipt = StringBuffer();
//     receipt.writeln("Here's your receipt.");
//     receipt.writeln();

//     //format the date to include up to seconds only
//     String formattedDate = DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now());

//     receipt.writeln(formattedDate);
//     receipt.writeln();
//     receipt.writeln("-----------------");
//     receipt.writeln();

//     for (final cartItem in _cart) {
//       receipt.writeln(
//         "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
//       );
//       if (cartItem.selectedAddons.isNotEmpty) {
//         receipt.writeln("     Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
//       }
//       receipt.writeln();
//     }
//     receipt.writeln("-----------------");
//     receipt.writeln();
//     receipt.writeln("Total Items: ${getTotalItemCount()}");
//     receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
//     receipt.writeln();
//     receipt.writeln("Delivering to: $deliveryAddress");

//     return receipt.toString();
//   }

//   //format double value into money
//   String _formatPrice(double price) {
//     return "${price.toStringAsFixed(2)} LKR";
//   }

//   //format list of addons into a string summary
//   String _formatAddons(List<Addon> addons) {
//     return addons
//       .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
//       .join(", ");
//   }
// }