import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/product.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/screens/detail_screen.dart';
import 'package:products_api/services/product.api.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    _products = await ProductAPI.fetchProduct();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              color: ColorConstants.lightGreyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ControllerPage(page: 0)
                        )
                      );
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
            "My Favorite",
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
          itemCount: _products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      DetailScreen(product: _products[index]
                    )
                  )
                );
              }),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          _products[index].image,
                          fit: BoxFit.cover,
                          height: 130,
                          width: 110,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _products[index].title,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "\$${_products[index].price}",
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                Text(
                                  _products[index].category,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ColorConstants.darkGreyColor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: ColorConstants
                                                    .lightGreyColor
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4))),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons
                                                      .delete_outline_outlined,
                                                  size: 26,
                                                  color: Colors.red,
                                                )),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: ColorConstants
                                                    .lightGreyColor
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4))),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  color: ColorConstants
                                                      .pinkColor,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            );
          },
        ),
      ),
    );
  }
}
