import 'package:ecommerce_dashboard/views/home/home_content_desktop.dart';
import 'package:ecommerce_dashboard/views/home/home_content_mobile.dart';
import 'package:ecommerce_dashboard/views/home/home_content_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeContentMobile(
        greeting: 'Good Morning',
        userName: 'Anna',
        description: 'Here\'s what\'s happening with your store today.',
      ),
      tablet: (BuildContext context) => HomeContentTablet(),
      desktop: (BuildContext context) => HomeContentDesktop(),
    );
  }
}
