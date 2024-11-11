import 'dart:io';

import 'package:ecommerce_dashboard/widgets/navigation_bar/navigation_bar_desktop.dart';
import 'package:ecommerce_dashboard/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavbarItem extends StatelessWidget implements PreferredSizeWidget {
  const NavbarItem({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isIpadAir(BuildContext context) {
       // If running on the web, skip platform check and base the layout purely on screen size.
      if (kIsWeb) {
        return false;
      }

      // Check if the platform is iOS and the width falls within typical iPad range
      final size = MediaQuery.of(context).size;
      return Platform.isIOS && 
      size.shortestSide >= 820 &&
        size.shortestSide < 1024;
    }

    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const NavigationBarMobile(),
      tablet: (BuildContext context) {
        // Use NavigationBarMobile if it's an iPad, else use NavigationBarDesktop
        return isIpadAir(context)
            ? const NavigationBarDesktop()
            : const NavigationBarMobile();
      },
      desktop: (BuildContext context) => const NavigationBarDesktop(),
    );
  }
}
