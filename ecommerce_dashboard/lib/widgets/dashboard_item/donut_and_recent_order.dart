import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/donut_source_chart.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/order_model.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_order_table.dart';
import 'package:ecommerce_dashboard/widgets/texts/text_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonutAndRecentOrder extends StatefulWidget {
  const DonutAndRecentOrder({super.key});

  @override
  State<DonutAndRecentOrder> createState() => _DonutAndRecentOrderState();
}

class _DonutAndRecentOrderState extends State<DonutAndRecentOrder> {
  String dropdownValue = 'Report';
  final List<String> sourceMenuActions = <String>[
    'Report',
    'Download Report',
    'Export',
    'Import'
  ];

  final List<ChartData> data = [
    ChartData('Direct', 25.6),
    ChartData('Social', 32.0),
    ChartData('Email', 23.8),
    ChartData('Other', 9.9),
    ChartData('Referrals', 8.7),
  ];
  final TooltipBehavior tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Column(
        children: [
          _buildDonutSection(),
          const SizedBox(
            height: 32,
          ),
          _buildRecentOrdersSection(),
        ],
      ),
      tablet: (BuildContext context) => Column(
        children: [
          _buildDonutSection(),
          const SizedBox(
            height: 32,
          ),
          _buildRecentOrdersSection(),
        ],
      ),
      desktop: (BuildContext context) => SizedBox(
        height: 400,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildDonutSection(),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              flex: 2,
              child: _buildRecentOrdersSection(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDonutSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Store Visits by Source",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down,
                        color: AppColors.greyColor),
                    items: sourceMenuActions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.greyColor,
          ),
          DonutSourceChart(data: data, tooltip: tooltip),
        ],
      ),
    );
  }

  Widget _buildRecentOrdersSection() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        descriptionTextStyle(sizingInformation.deviceScreenType);
        TextStyle titleStyle =
            titleTextStyle(sizingInformation.deviceScreenType);

        double widthDevice =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 700
                : (sizingInformation.deviceScreenType == DeviceScreenType.tablet
                    ? 950
                    : 1210);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Orders",
                      style: titleStyle,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.whiteColor,
                        backgroundColor: AppColors.lightBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      icon: const Icon(
                        Icons.document_scanner_outlined,
                        size: 12,
                      ),
                      label: const Text(
                        "Generate Report",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: widthDevice,
                  color: Colors.white,
                  child: RecentOrderTable(
                    orders: [
                      OrderModel(
                        orderId: "123453",
                        customerImage: 'assets/images/user_profile.jpg',
                        customerName: "Alice",
                        product: "Laptop",
                        amount: 1224.50,
                        vendor: "TechCorp",
                        status: Status.paid,
                        rating: 4.6,
                        vote: 62,
                      ),
                      OrderModel(
                        orderId: "123453",
                        customerImage: 'assets/images/user_profile.jpg',
                        customerName: "Alice",
                        product: "Laptop",
                        amount: 1224.50,
                        vendor: "TechCorp",
                        status: Status.pending,
                        rating: 4.6,
                        vote: 62,
                      ),
                      OrderModel(
                        orderId: "123453",
                        customerImage: 'assets/images/user_profile.jpg',
                        customerName: "Alice",
                        product: "Laptop",
                        amount: 1224.50,
                        vendor: "TechCorp",
                        status: Status.unpaid,
                        rating: 4.6,
                        vote: 62,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
