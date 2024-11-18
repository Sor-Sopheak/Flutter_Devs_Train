import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/constants/form_number.dart';
import 'package:ecommerce_dashboard/styles/on_hover_background.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BestSellingRow extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String date;
  final double price;
  final int orders;
  final int stock;
  final int amount;
  const BestSellingRow({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.date,
    required this.price,
    required this.orders,
    required this.stock,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double paddingItems;
      double heightSpace;
      double widthSpace;

      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        paddingItems = 10.0;
        heightSpace = 16.0;
        widthSpace = 16.0;
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        paddingItems = 10.0;
        heightSpace = 12.0;
        widthSpace = 12.0;
      } else {
        paddingItems = 8.0;
        heightSpace = 8.0;
        widthSpace = 8.0;
      }

      return OnHoverBackground(builder: (isHovered) {
        final bgColor = isHovered ? AppColors.backgroundColor : AppColors.whiteColor;
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
                    itemImage,
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
                      itemName,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: heightSpace,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 14,
                      ),
                    )
                  ],
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
                        "\$${price.toString()}",
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Price",
                        style:
                            TextStyle(color: AppColors.greyColor, fontSize: 14),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: heightSpace,
                ),
                SizedBox(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$orders',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Orders",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      decoration: BoxDecoration(
                          color: stock == 0
                              ? AppColors.redColor.withOpacity(.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        stock == 0 ? 'Out of stock' : '$stock',
                        style: TextStyle(
                          color: stock == 0
                              ? AppColors.redColor
                              : AppColors.blackColor,
                          fontSize: stock == 0 ? 12 : 16,
                        ),
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
                if (stock == 0) ...{
                  const SizedBox(
                    height: 16,
                  ),
                } else ...{
                  const SizedBox(
                    width: 45,
                  ),
                },
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${formatNumber(amount.toString().replaceAll(',', ''))}",
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Amount",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
