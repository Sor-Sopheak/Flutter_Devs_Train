import 'package:flutter/material.dart';
import 'package:products_api/screens/auth/profile/profile_screen.dart';
import 'package:products_api/screens/cart/cart_screen.dart';
import 'package:products_api/screens/favorites/favorite_screen.dart';
import 'package:products_api/screens/home_screen.dart';

import '../constants/color_constants.dart';

class ControllerPage extends StatefulWidget {
  final int page;
  const ControllerPage({super.key, required this.page});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  late final PageController pageController;
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize PageController and _selectedIndex based on widget.page
    pageController = PageController(initialPage: widget.page);
    _selectedIndex = widget.page;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: const <Widget>[
              HomeScreen(),
              CartScreen(),
              FavoriteScreen(),
              ProfileScreen()
            ],
          ),

          //conditional to hide and show bar
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            selectedItemColor: ColorConstants.blackColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Icon(Icons.home_outlined, size: 32),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 32,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 32,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Icon(
                    Icons.person_outline_outlined,
                    size: 32,
                  ),
                ),
                label: '',
              ),
            ],
          )),
    );
  }
}
