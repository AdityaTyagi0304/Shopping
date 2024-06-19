import '../models/product.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });
}

class Cart {
  List<CartItem> items = [];

  void addToCart(Product product) {
    // Add logic to add product to cart
  }

  void removeFromCart(String productId) {
    // Add logic to remove product from cart
  }

  double get totalAmount {
    // Calculate and return total amount in cart
    return 0.0;
  }
}
