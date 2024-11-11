import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/constants/enums/item_enum.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/revenue_items/revenue_item_category.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RevenueItemCategoryDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      // Determine how many rows and columns based on screen size
      int itemsPerRow =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? 4
              : 2;

      final List<Widget> items = [
        const RevenueItemCategory(
          total: 1234,
          title: "Orders",
          numType: numberType.naturalNumber,
        ),
        const RevenueItemCategory(
          total: 12876556,
          title: "Earnings",
          numType: numberType.currency,
        ),
        const RevenueItemCategory(
          total: 556,
          title: "Refunds",
          numType: numberType.naturalNumber,
        ),
        const RevenueItemCategory(
          total: 12.36,
          title: "Conversion Rate",
          numType: numberType.percentage,
        ),
      ];

      // Generate rows dynamically
      List<Widget> rows = [];
      for (int i = 0; i < items.length; i += itemsPerRow) {
        List<Widget> rowItems = [];

        // Create items for this row with DottedLine in between if necessary
        for (int j = 0; j < itemsPerRow; j++) {
          if (i + j < items.length) {
            if (j > 0) {
              rowItems.add(
                DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  lineThickness: 1,
                  lineLength: 80,
                  dashLength: 2,
                  dashGapLength: 2,
                  dashColor: AppColors.greyColor.withOpacity(.2),
                ),
              );
            }
            rowItems.add(Expanded(child: items[i + j]));
          }
        }

        rows.add(Row(children: rowItems));

        // Add spacing between rows
        // if (i + itemsPerRow < items.length) {
        //   rows.add(const SizedBox(height: 16.0));
        // }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rows,
      );
    });
  }
}
