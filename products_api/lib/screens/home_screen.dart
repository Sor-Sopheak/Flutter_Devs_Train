import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/screens/detail_screen.dart';
import 'package:products_api/utils/capitalized_extension.dart';
import 'package:products_api/widgets/product.dart';
import 'package:products_api/widgets/product_order.dart';
import 'package:products_api/widgets/product_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //hide hint text in text field
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  int _selectedCategoryIndex = 0;

  final categoryList = <String>[
    'favorites',
    'following',
    'On sale',
    'brand',
    'favorites',
    'following',
    'On sale',
    'brand'
  ];

  @override
  void initState() {
    super.activate();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.activate();
  }

  //navigate to detail screen
  void navigateToDetail() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailScreen()));
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
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
                                  FontAwesomeIcons.bolt,
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
                                icon: const FaIcon(
                                  FontAwesomeIcons.dollarSign,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // category
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _selectedCategoryIndex = index;
                                });
                              }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                  color: _selectedCategoryIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: Text(
                                  categoryList[index].capitalize(),
                                  style: TextStyle(
                                      color: _selectedCategoryIndex == index
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

                    const SizedBox(height: 25),
                    Container(
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
                                  child: const ProductTitle(title: "Order")),
                              SizedBox(
                                height: 160,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (() {
                                        setState(() {});
                                      }),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: ProductOrder(
                                          img:
                                              'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
                                          type: 'men\'s clothing',
                                          name:
                                              'Mens Casual Premium Slim Fit T-Shirts',
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
                                  child: const ProductTitle(title: "For you")),
                              SizedBox(
                                height: 400,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (() {
                                        setState(() {
                                          Navigator.pushNamed(
                                              context, '/detail');
                                        });
                                      }),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Product(
                                          title: "To Molly Form James",
                                          type: "Oversize sweater",
                                          price: 70.9,
                                          img:
                                              'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
                                          isFavourite: true,
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
