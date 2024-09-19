import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/category.dart';
import 'package:products_api/models/user.dart';
import 'package:products_api/screens/detail_screen.dart';
import 'package:products_api/services/auth.api.dart';
import 'package:products_api/services/category.api.dart';
import 'package:products_api/services/product.api.dart';
import 'package:products_api/utils/capitalized_extension.dart';
import 'package:products_api/widgets/product_widget.dart';
import 'package:products_api/widgets/product_order.dart';
import 'package:products_api/widgets/product_title.dart';
import 'package:products_api/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Category> _categories;
  bool _isLoading = true;

  List<Product> _products = [];
  bool _isLoadingProducts = true;
  List<Product> _limitProducts = [];
  bool _isLoading5Products = true;

  User? _user;
  bool _isLoadingProfile = true;

  Product? _selectedProduct;
  //hide hint text in text field
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  int _selectedCategoryIndex = 0;

  Map<String, dynamic>? decodedToken;

  @override
  void initState() {
    super.initState();

    fetchCategory();
    fetchProduct();
    getLimitProduct(5);

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    loadAndToken();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.activate();
  }

  Future<void> fetchCategory() async {
    _categories = await CategoryAPI.fetchCategory();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> fetchProduct() async {
    _products = await ProductAPI.fetchProduct();
    setState(() {
      _isLoadingProducts = false;
    });
  }

  Future<void> getProductsByCategory(String category) async {
    _products = await ProductAPI.getProductsByCategory(category);
    setState(() {
      _isLoadingProducts = false;
    });
  }

  Future<void> getOneProduct(int id) async {
    _selectedProduct = await ProductAPI.getOneProduct(id);
    setState(() {
      _isLoadingProducts = false;
    });
  }

  Future<void> getLimitProduct(int limit) async {
    _limitProducts = await ProductAPI.getLimitProduct(limit);
    setState(() {
      _isLoading5Products = false;
    });
  }

  Future<void> getOneUser(int id) async {
    _user = await AuthAPI.getOneUser(id);
    setState(() {
      _isLoadingProfile = false;
    });
  }

  Future<void> loadAndToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      Map<String, dynamic> decoded = decodeToken(token);
      int userId = decoded['sub'];

      setState(() {
        decodedToken = decoded;
      });

      await getOneUser(userId);
    } else {
      setState(() {
        _isLoadingProfile = false;
      });
    }
  }

  Map<String, dynamic> decodeToken(String token) {
    final splitToken = token.split('.');
    if (splitToken.length != 3) {
      throw Exception('Invalid token format');
    }

    try {
      final payloadBase64 = splitToken[1];
      final normalizedPayload = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      final decodedPayload = jsonDecode(payloadString);
      return decodedPayload;
    } catch (e) {
      throw const FormatException('Invalid payload');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstants.blackColor,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Row(
                          children: [
                            Expanded(
                                child: _isLoadingProfile
                                    ? const CircularProgressIndicator()
                                    : _user != null && decodedToken != null
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Welcome, ${_user!.username}!',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_rounded,
                                                    color: Colors.grey,
                                                    size: 22,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  _user != null &&
                                                          decodedToken != null
                                                      ? Text(
                                                          "${_user!.address?.city}, ${_user!.address?.zipcode}",
                                                          style: TextStyle(
                                                              color: ColorConstants
                                                                  .lightGreyColor,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 18),
                                                        )
                                                      : Text(
                                                          "No token.",
                                                          style: TextStyle(
                                                              color: ColorConstants
                                                                  .lightGreyColor,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 18),
                                                        ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color: Colors.grey,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          )
                                        : const Text(
                                            "not loading",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstants.darkGreyColor,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    FontAwesomeIcons.cartArrowDown,
                                    color: Colors.white,
                                  )),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstants.darkGreyColor,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(FontAwesomeIcons.solidBell,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorConstants.darkGreyColor,
                                    borderRadius: BorderRadius.circular(14)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: _isFocused ? null : "Search",
                                      hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 12),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(14),
                                        ),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14)),
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstants.darkGreyColor,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    FontAwesomeIcons.bars,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // category
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        height: 45,
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _categories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final category = _categories[index];
                                  return GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        _selectedCategoryIndex = index;
                                        getProductsByCategory(category.name);
                                      });
                                    }),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                        color: _selectedCategoryIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                      child: Text(
                                        _categories[index].name.capitalize(),
                                        style: TextStyle(
                                            color:
                                                _selectedCategoryIndex == index
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontWeight:
                                                _selectedCategoryIndex == index
                                                    ? FontWeight.w600
                                                    : FontWeight.normal,
                                            fontFamily: 'Poppins',
                                            fontSize: 18),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.698,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16))),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  child: const ProductTitle(
                                      title: "Special Offers")),
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _limitProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(
                                                        product: _limitProducts[
                                                            index])));
                                      }),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: _isLoading5Products
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : ProductOrder(
                                                img:
                                                    _limitProducts[index].image,
                                                type: _limitProducts[index]
                                                    .category,
                                                name:
                                                    _limitProducts[index].title,
                                                promo: "Dilivery Today",
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  child: const ProductTitle(
                                      title: "Featured Products")),
                              SizedBox(
                                height: 390,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(
                                                        product:
                                                            _products[index])));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: _isLoadingProducts
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ProductWidget(
                                                title: _products[index].title,
                                                type: _products[index].category,
                                                price: _products[index].price,
                                                img: _products[index].image,
                                                isFavourite: true,
                                                favorite: () => {},
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
