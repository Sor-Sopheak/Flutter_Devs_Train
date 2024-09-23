import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:products_api/main.dart';
import 'package:products_api/models/list_promo.dart';
import 'package:products_api/models/product.dart';
import 'package:products_api/models/promo.dart';

class CartProvider extends ChangeNotifier {
  var flutterCart = FlutterCart();

  final ListPromo _promoCodes = ListPromo.fromJson(ListPromo.getJsonData());

  void addToCart(Product product, int quantity, Promo? promo) {
    double subtotal = product.price * quantity;
    double discount = promo != null ? (subtotal * promo.discount / 100) : 0.0;
    double total = subtotal - discount;

    flutterCart.addToCart(
      cartModel: CartModel(
          productId: product.id.toString(),
          productName: product.title,
          variants: [ProductVariant(price: product.price)],
          productDetails: product.category,
          productImages: [product.image]),
    );

    notifyListeners();
  }

  void updateQuantity(CartModel item, int newQuantity) {
    cart.updateQuantity(item.productId, item.variants, newQuantity);
    notifyListeners();
  }

  void removeFromCart(CartModel item) {
    cart.removeItem(item.productId, item.variants);
    notifyListeners();
  }

  void clearCart() {
    cart.clearCart();
    notifyListeners();
  }

  double getDiscount(String code) {
    double discount = 0;
    for (Promo promo in _promoCodes.listPromo) {
      if (promo.code == code) {
        discount = promo.discount;
        break;
      }
    }
    return discount;
  }

  int get getCartCount => cart.cartLength;
  List<CartModel> get getCartItems => cart.cartItemsList;
  double getTotalAmount(double discount) {
    double afterDiscount = cart.subtotal - (cart.subtotal * discount / 100);
    return afterDiscount;
  }

  double get getSubTotal => cart.subtotal;
}
