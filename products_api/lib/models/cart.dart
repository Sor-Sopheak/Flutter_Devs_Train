import 'package:products_api/models/product.dart';
import 'package:products_api/models/promo.dart';

class Cart {
  final Product product;
  int quantity;
  final Promo? promo;
  late final double subtotal;
  late final double total;

  Cart(
      {required this.product,
      this.quantity = 1,
      required this.subtotal,
      required this.total,
      this.promo});
}
