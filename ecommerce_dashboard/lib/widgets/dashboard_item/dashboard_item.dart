import 'dart:math';

import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/constants/form_number.dart';
import 'package:ecommerce_dashboard/widgets/buttons/icon_item.dart';
import 'package:ecommerce_dashboard/widgets/constraints/sized_box_spacing.dart';
import 'package:ecommerce_dashboard/widgets/texts/text_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final double totalRate;
  final double previousRate;
  final int total;
  final String navigateText;
  final VoidCallback? detail;
  final bool isNormalNumber;
  final iconType icon;
  final Color backgroundColor;
  const DashboardItem({
    super.key,
    required this.title,
    required this.total,
    required this.navigateText,
    this.detail,
    required this.totalRate,
    required this.previousRate,
    required this.isNormalNumber,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    double status = totalRate - previousRate;
    final Color changeColor;
    if (status < 0) {
      changeColor = AppColors.redColor;
    } else if (status > 0) {
      changeColor = AppColors.greenColor;
    } else {
      changeColor = AppColors.greyColor;
    }

    final IconData changeIcon;
    if (status < 0) {
      changeIcon = Icons.arrow_outward_sharp;
    } else if (status > 0) {
      changeIcon = Icons.arrow_outward_sharp;
    } else {
      changeIcon = Icons.add;
    }

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      TextStyle largeTitleStyle =
          LargeTitleTextStyle(sizingInformation.deviceScreenType);
      TextStyle descriptionStyle =
          descriptionTextStyle(sizingInformation.deviceScreenType);

      SizedBox heightSized = HeightSized(sizingInformation.deviceScreenType);
      

      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: descriptionStyle,
                    ),
                    heightSized,
                    Text(
                      isNormalNumber
                          ? formatNumber(total.toString().replaceAll(',', ''))
                          : formatCompactNumber(total),
                      style: largeTitleStyle,
                    ),
                    heightSized,
                    Text(
                      navigateText,
                      style: const TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blueColor,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Transform.rotate(
                          angle: (status > 0)
                              ? 0
                              : (status < 0)
                                  ? 180 * pi / 180
                                  : 0,
                          child: Icon(
                            changeIcon,
                            color: changeColor,
                            size: 12,
                          ),
                        ),
                        Text(
                          status > 0
                              ? '+${totalRate} %'
                              : status < 0
                                  ? '-${totalRate.abs()} %'
                                  : '0.00 %',
                          style: TextStyle(
                            color: changeColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    IconItem(
                      icon: icon,
                      backgroundColor: backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
