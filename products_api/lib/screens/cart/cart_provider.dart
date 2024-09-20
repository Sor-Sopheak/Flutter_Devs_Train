import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:products_api/main.dart';
import 'package:products_api/models/cart.dart';
import 'package:products_api/models/product.dart';
import 'package:products_api/models/promo.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;

  final List<Promo> _promoCodes = [];
  List<Promo> get promoCode => _promoCodes;

  void addToCart(Product product, int quantity, Promo? promo) {
    double subtotal = product.price * quantity;
    double discount = promo != null ? (subtotal * promo.discount / 100) : 0.0;
    double total = subtotal - discount;

    var existingCartItem = _cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => Cart(product: product, quantity: 0, subtotal: 0, total: 0),
    );

    if (existingCartItem.quantity > 0) {
      existingCartItem.quantity += quantity;
      existingCartItem.subtotal += subtotal;
      existingCartItem.total += total;
    } else {
      _cartItems.add(Cart(product: product, subtotal: subtotal, total: total));
    }

    notifyListeners();
  }

  int getProductQuantity(int productId) {
    int quantity = 0;
    for (Cart item in _cartItems) {
      if (item.product.id == productId) {
        quantity += item.quantity;
      }
    }

    return quantity;
  }

  void updateQuantity(CartModel item, int newQuantity) {
    cart.updateQuantity(item.productId, item.variants, newQuantity);
  }

  void removeFromCart(CartModel item) {
    cart.removeItem(item.productId, item.variants);
    notifyListeners();
  }

  void clearCart() {
    cart.clearCart();
  }

  void getDiscount(String code) {
    for (Promo promo in _promoCodes) {
      if (promo.code == code) {
        // getTotalAmount = getSubTotal - promo.discount;
      }
    }
  }

  int get getCartCount => cart.cartLength;
  List<CartModel> get getCartItems => cart.cartItemsList;
  double get getTotalAmount => cart.total;
  double get getSubTotal => cart.subtotal;
}
