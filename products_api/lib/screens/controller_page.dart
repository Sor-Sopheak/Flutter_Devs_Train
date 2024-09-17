import 'package:flutter/material.dart';
import 'package:products_api/screens/auth/profile_screen.dart';
import 'package:products_api/screens/cart_screen.dart';
import 'package:products_api/screens/home_screen.dart';

import '../constants/color_constants.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

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
              Center(
                child: HomeScreen(),
              ),
              Center(
                child:CartScreen(),
              ),
              Center(
                child: HomeScreen(),
              ),
              Center(
                child: ProfileScreen(),
              )
            ],
          ),

        //conditional to hide and show bar
          bottomNavigationBar: _selectedIndex == 1 ? null : BottomNavigationBar(
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
                  padding: EdgeInsets.only(top: 18),
                  child: Icon(Icons.home_outlined, size: 32),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Icon(Icons.shopping_bag_outlined, size: 32,),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 32,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Icon(Icons.person_outline_outlined, size: 32,),
                ),
                label: '',
              ),
            ],
          )),
    );
  }
}
