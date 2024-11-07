import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum iconType { current, shop, user, balance, icon }

extension ChangeIconType on iconType {
  Widget get icon {
    switch (this) {
      case iconType.current:
        return const Icon(
          Icons.monetization_on_outlined,
          color: AppColors.greenColor,
        );
      case iconType.shop:
        return const Icon(
          Icons.shopping_bag_outlined,
          color: AppColors.lightBlueColor,
        );
      case iconType.user:
        return SvgPicture.asset('assets/icons/person_circle.svg');
      case iconType.balance:
        return const Icon(
          Icons.account_balance_wallet_outlined,
          color: AppColors.blueColor,
        );
      default:
        return const Icon(
          Icons.monetization_on_outlined,
          color: AppColors.greenColor,
        );
    }
  }
}

class IconItem extends StatelessWidget {
  final iconType icon; //accept any types of icon
  final Color backgroundColor;
  final double? height;
  final double? width;
  const IconItem({
    super.key,
    required this.icon,
    this.height,
    this.width,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        constraints: BoxConstraints(
          minWidth: 42,
          maxWidth: width ?? double.infinity,
        ),
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: SizedBox(
          width: 22,
          height: 22,
          child: icon.icon, 
        ),
      ),
    );
  }
}
