import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/constants/enums/item_enum.dart';
import 'package:ecommerce_dashboard/constants/form_number.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RevenueItemCategory extends StatelessWidget {
  final double total;
  final String title;
  final numberType numType;
  const RevenueItemCategory({
    super.key,
    required this.total,
    required this.title,
    required this.numType,
  });

  @override
  Widget build(BuildContext context) {
    final Color changeTextColor;
    switch (numType) {
      case numberType.naturalNumber:
      case numberType.largeNumber:
      case numberType.currency:
        changeTextColor = AppColors.blackColor;
      case numberType.percentage:
        changeTextColor = AppColors.greenColor;
        break;
      default:
        changeTextColor = AppColors.blackColor;
    }

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        color: AppColors.backgroundColor.withOpacity(0.2),
        child: DottedBorder(
          customPath: (size) {
            return Path()
              ..moveTo(0, 0) // Start at the top-left corner
              ..lineTo(size.width, 0) // Draw the top line
              ..moveTo(0, size.height) // Move to the bottom-left corner
              ..lineTo(size.width, size.height); // Draw the bottom line
          },
          color: AppColors.backgroundColor,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    numType == numberType.percentage
                        ? '$total%'
                        : numType == numberType.currency
                            ? '\$${formatCompactNumber(total.toInt())}'
                            : formatNumber(total.toString().replaceAll(',', '')),
                    style: TextStyle(
                      color: changeTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
