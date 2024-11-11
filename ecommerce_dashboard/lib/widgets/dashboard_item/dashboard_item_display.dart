import 'dart:io';

import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/buttons/icon_item.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/dashboard_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardItemDisplay extends StatelessWidget {
  final List<Widget> items = [
    DashboardItem(
      total: 36765098,
      navigateText: 'View all orders',
      detail: () {},
      title: 'Total Earings',
      totalRate: 3.21,
      previousRate: 3.54,
      isNormalNumber: true,
      icon: iconType.current,
      backgroundColor: AppColors.greenColor,
    ),
    DashboardItem(
      total: 36098,
      navigateText: 'View all orders',
      detail: () {},
      title: 'Total Earings',
      totalRate: 4.21,
      previousRate: 3.54,
      isNormalNumber: false,
      icon: iconType.shop,
      backgroundColor: AppColors.lightBlueColor,
    ),
    DashboardItem(
      total: 36098,
      navigateText: 'See details',
      detail: () {},
      title: 'Total Earings',
      totalRate: 3.21,
      previousRate: 3.21,
      isNormalNumber: true,
      icon: iconType.user,
      backgroundColor: AppColors.yellowColor,
    ),
    DashboardItem(
      total: 36098,
      navigateText: 'View all orders',
      detail: () {},
      title: 'Total Earings',
      totalRate: 8.21,
      previousRate: 3.54,
      isNormalNumber: true,
      icon: iconType.balance,
      backgroundColor: AppColors.blackColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      bool isIpadAir(BuildContext context) {
        if (kIsWeb) {
          return false;
        }

        final size = MediaQuery.of(context).size;
        return Platform.isIOS &&
            size.shortestSide >= 820 &&
            size.shortestSide < 1024; // iPad Air 4 screen width range
      }

      bool isIpadPro(BuildContext context) {
        if (kIsWeb) {
          return false;
        }

        final size = MediaQuery.of(context).size;
        return Platform.isIOS &&
            size.shortestSide >= 1024; // iPad Pro (screen width > 1024)
      }

      //items row
      int crossAxisCount = sizingInformation.deviceScreenType ==
              DeviceScreenType.desktop
          ? 4 // 4 columns for desktop
          : (isIpadAir(context) // If it's iPad Air (1 row)
              ? 1
              : (isIpadPro(context) // If it's iPad Pro (2 rows)
                  ? 2
                  : (sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet // For other tablets (2 rows)
                      ? 2
                      : 1))); // 1 row for mobile

      double itemHeight;

      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        itemHeight = 50.0; 
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        itemHeight = 45.0; 
      } else {
        itemHeight = 40.0; 
      }
      
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1 / (itemHeight / 100),
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return items[index];
        },
      );
    });
  }
}
