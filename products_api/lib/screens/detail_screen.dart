import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/product.dart';
import 'package:products_api/screens/cart/cart_provider.dart';
import 'package:products_api/widgets/product_detail.dart';
import 'package:provider/provider.dart';


class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late CartProvider cartProvider;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartProvider = Provider.of<CartProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.pop(context);
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
            'For you',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.ios_share_rounded,
              size: 32,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      // Scrollable content
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProductDetail(
                  img: widget.product.image,
                  name: widget.product.title,
                  type: widget.product.category,
                  rate: widget.product.rating.rate,
                  count: widget.product.rating.count,
                  price: widget.product.price,
                  desc: widget.product.description),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Fixed button at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: ElevatedButton(
          onPressed: () {
            cartProvider.addToCart(
              widget.product, 1, null
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: ColorConstants.blackColor,
            shadowColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          child: const Text(
            "Add to cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
