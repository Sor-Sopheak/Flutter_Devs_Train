import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/styles/on_hover_background.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TopSellerRow extends StatelessWidget {
  final String shopImage;
  final String shopeName;
  final String sellerName;
  final String product;
  final int stock;
  final double price;
  final double rate;
  const TopSellerRow({
    super.key,
    required this.shopImage,
    required this.shopeName,
    required this.sellerName,
    required this.product,
    required this.stock,
    required this.price,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double paddingItems;
      double heightSpace;
      double widthSpace;

      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        paddingItems = 16.0;
        heightSpace = 16.0;
        widthSpace = 16.0;
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        paddingItems = 12.0;
        heightSpace = 12.0;
        widthSpace = 12.0;
      } else {
        paddingItems = 8.0;
        heightSpace = 8.0;
        widthSpace = 8.0;
      }

      return OnHoverBackground(builder: (isHovered) {
        final bgColor =
            isHovered ? AppColors.backgroundColor : AppColors.whiteColor;

        return Container(
          color: bgColor,
          child: Padding(
            padding: EdgeInsets.all(paddingItems),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    shopImage,
                    width: 40,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopeName,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      sellerName,
                      style: const TextStyle(
                          color: AppColors.greyColor, fontSize: 14),
                    )
                  ],
                ),
                SizedBox(
                  width: widthSpace,
                ),
                Text(
                  product,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: widthSpace,
                ),
                SizedBox(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$stock',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Stock",
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: heightSpace,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    "\$${price.toString()}",
                    style: const TextStyle(
                        color: AppColors.greyColor, fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: widthSpace,
                ),
                SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      Text(
                        "$rate\%",
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.analytics_outlined,
                        color: AppColors.greenColor,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
