import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/product.dart';
import 'package:products_api/models/promo.dart';
import 'package:products_api/screens/cart/cart_provider.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/widgets/cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int _counter = 0;

  void applyPromoCode() {
    
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    //get cart item
    final cartItems = cartProvider.cartItems;
    double totalAmount = cartItems.fold(0, (total, item) => total + item.total);
    double subtotalAmount =
        cartItems.fold(0, (subtotal, item) => subtotal + item.subtotal);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: ColorConstants.lightGreyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ControllerPage(page: 0)));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstants.darkGreyColor,
                      size: 20,
                    ))),
          ),
        ),
        title: const Center(
          child: Text(
            "My cart",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cartProvider.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            var cartItem = cartProvider.cartItems[index];
            var discount = cartItem.promo?.discount ?? 0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CartWidget(
                name: cartItem.product.title,
                price: cartItem.product.price,
                quantity: cartItem.quantity,
                img: cartItem.product.image,
                category: cartItem.product.category,
              )
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Promocode",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 8),

              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstants.lightGreyColor,
                  hintText: "Enter promocode",
                  hintStyle: const TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                ),
                // onSaved: (code) => cartItems.promo.code = code,
                validator: (code) {
                  // if (code == null || code.isEmpty) {
                  //   return cartItems.promo!.discount = 0;
                  // } else if (code.compareTo(cartItems.promo.code)) {
                  //   return cartItems.promo!.discount = discount;
                  // }
                  return null;
                },
              ),

              const Spacer(), // Pushes the button to the bottom

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${subtotalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " - ${subtotalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$${totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: ColorConstants.blackColor,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  minimumSize: const Size.fromHeight(50), // full width
                ),
                child: const Text(
                  "Check out",
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
