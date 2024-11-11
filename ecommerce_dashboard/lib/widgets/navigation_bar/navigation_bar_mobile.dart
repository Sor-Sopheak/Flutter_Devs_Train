import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/profiles/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarMobile extends StatelessWidget implements PreferredSizeWidget {
  const NavigationBarMobile({super.key});

  // Define preferredSize as required by PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      leading: IconButton(
        onPressed: () {
          // Mobile open drawer
          Scaffold.of(context).openDrawer();
        },
        icon: SvgPicture.asset(
          'assets/icons/arrowright.svg',
          width: 26,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Mobile drop-down search
          },
          icon: const Icon(
            Icons.search,
            size: 26,
            color: AppColors.greyColor,
          ),
        ),
        IconButton(
          onPressed: () {
            // Drop-down flag language
          },
          icon: Image.asset(
            'assets/icons/uk_flag.png',
            width: 26,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 26,
            color: AppColors.greyColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            size: 26,
            color: AppColors.greyColor,
          ),
        ),

        const UserProfile(image: 'assets/images/user_profile.jpg')

      ],
    );
  }
}