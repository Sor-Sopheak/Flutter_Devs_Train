import 'dart:math';

import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/profiles/user_profile.dart';
import 'package:ecommerce_dashboard/widgets/search/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarDesktop extends StatelessWidget
    implements PreferredSizeWidget {
  const NavigationBarDesktop({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // Mobile open drawer
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/arrowright.svg',
              width: 32,
            ),
          ),
          const CustomSearch()
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Drop-down flag language
          },
          icon: Image.asset(
            'assets/icons/uk_flag.png',
            width: 28,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.category_outlined,
            size: 28,
            color: AppColors.greyColor,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 28,
                color: AppColors.greyColor,
              ),
            ),
            Positioned(
              top: 0.0,
              right: 2.0,
              width: 18.0,
              height: 18.0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlueColor,
                ),
                child: Text(
                  2.toString(),
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.zoom_out_map_rounded,
            size: 28,
            color: AppColors.greyColor,
          ),
        ),
        Transform.rotate(
          angle: 140 * pi / 180,
          child: IconButton(
            icon: const Icon(
              Icons.mode_night_outlined,
              size: 28,
              color: AppColors.greyColor,
            ),
            onPressed: () {},
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                size: 28,
                color: AppColors.greyColor,
              ),
            ),
            Positioned(
              top: 0.0,
              right: 2.0,
              width: 18.0,
              height: 18.0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.redColor,
                ),
                child: Text(
                  2.toString(),
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(color: AppColors.backgroundColor),
          child: const UserProfile(
            image: 'assets/images/user_profile.jpg',
            name: "Anna Adam",
            position: "Founder",
            width: 38,
            height: 38,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
