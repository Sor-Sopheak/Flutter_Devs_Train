import 'package:ecommerce_dashboard/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => NavigationBarMobile(),
    );
  }
}