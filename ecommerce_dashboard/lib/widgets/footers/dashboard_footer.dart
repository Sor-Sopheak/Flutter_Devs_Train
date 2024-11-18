import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/constraints/padding_spacing.dart';
import 'package:ecommerce_dashboard/widgets/texts/text_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      TextStyle descriptionStyle =
          descriptionTextStyle(sizingInformation.deviceScreenType);
      EdgeInsets paddingAll = PaddingAll(sizingInformation.deviceScreenType);
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.whiteColor,
        ),
        child: Padding(
          padding: paddingAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "2024 © Velzon.",
                style: descriptionStyle,
              ),
              Text(
                "Design & Develop by Themesbrand",
                style: descriptionStyle,
              )
            ],
          ),
        ),
      );
    });
  }
}
