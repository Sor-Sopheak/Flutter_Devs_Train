import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/screens/cart/cart_provider.dart';
import 'package:products_api/screens/checkout/dot_indicator.dart';
import 'package:products_api/screens/checkout/shipping_screen.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/widgets/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double discount = 0;
  String promoteCode = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.getCartItems;
    double total = cartProvider.getTotalAmount(discount);
    double subtotal = cartProvider.getSubTotal;

    TextEditingController promoCodeController = TextEditingController();

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
                              builder: (context) =>
                                  const ControllerPage(page: 0)));
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
        actions: [
          IconButton(
              onPressed: () {
                cartProvider.clearCart();
              },
              icon: Icon(Icons.delete_outline_outlined,
                  size: 32,
                  color: ColorConstants.darkGreyColor.withOpacity(0.5))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            var cartItem = cartItems[index];
            var variant = cartItem.variants.first;
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CartWidget(
                  name: cartItem.productName,
                  price: variant.price,
                  quantity: cartItem.quantity,
                  category: cartItem.productDetails,
                  img: (cartItem.productImages?.isNotEmpty ?? false)
                      ? cartItem.productImages![0]
                      : '',
                  onMinus: () => cartProvider.decreaseQuantity(cartItem),
                  onAdd: () => cartProvider.increaseQuantity(cartItem),
                  onRemove: () => cartProvider.removeFromCart(cartItem),
                ));
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
                controller: promoCodeController..text = promoteCode,
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
                onFieldSubmitted: (code) {
                  setState(() {
                    discount = cartProvider.getDiscount(code);
                    promoteCode = code;
                  });
                },
                textInputAction: TextInputAction.done,
                validator: (code) {
                  if (code == null || code.isEmpty) {
                    return "kfakjsdfd";
                  } else if (cartProvider.getDiscount(code) == 0) {
                    return "Invalid code";
                  }
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
                        "\$${subtotal.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " - $discount",
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
                  RichText(
                    text: TextSpan(
                      text: cartProvider.getTotalItemInCart() <= 1
                          ? "(${cartProvider.getTotalItemInCart()} item) "
                          : "(${cartProvider.getTotalItemInCart()} items) ",
                      style: TextStyle(
                        color: ColorConstants.blackColor,
                      ),
                      children: [
                        TextSpan(
                          text: " \$${total.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DotIndicator()
                    )
                  );
                },
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
