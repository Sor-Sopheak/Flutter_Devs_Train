import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/screens/auth/guest_screen.dart';
import 'package:products_api/screens/auth/profile_screen.dart';
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
            children: const <Widget>[
              Center(
                child: HomeScreen(),
              ),
              Center(
                child: GuestScreen(),
              ),
              Center(
                child: HomeScreen(),
              ),
              Center(
                child: ProfileScreen(),
              )
            ],
          ),
      
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
