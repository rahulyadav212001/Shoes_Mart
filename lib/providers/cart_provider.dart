import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get totalItems => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _cartItems.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));

  void addToCart(Product product, String size, {int quantity = 1}) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );

    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity += quantity;
    } else {
      _cartItems.add(CartItem(
        id: '${product.id}-$size-${DateTime.now().millisecondsSinceEpoch}',
        product: product,
        size: size,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(String itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  void updateQuantity(String itemId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(itemId);
      return;
    }

    final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex >= 0) {
      _cartItems[itemIndex].quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}