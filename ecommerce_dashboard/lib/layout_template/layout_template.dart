import 'package:ecommerce_dashboard/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? null
            : null,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const NavigationBarMobile(),
            
          ],
        ),
      ),
    );
  }
}
