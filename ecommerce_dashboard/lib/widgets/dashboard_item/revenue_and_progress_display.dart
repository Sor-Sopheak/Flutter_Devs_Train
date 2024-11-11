import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/linear_progress.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/revenue_chart.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/revenue_items/revenue_item_category_display.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/statistic_chart.dart';
import 'package:ecommerce_dashboard/widgets/buttons/custom_text_button.dart';
import 'package:ecommerce_dashboard/widgets/constraints/sized_box_spacing.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueAndProgressDisplay extends StatefulWidget {
  const RevenueAndProgressDisplay({super.key});

  @override
  State<RevenueAndProgressDisplay> createState() =>
      _RevenueAndProgressDisplayState();
}

class _RevenueAndProgressDisplayState extends State<RevenueAndProgressDisplay> {
  int activeButtonIndex = 0;

  //progress
  final List<LinearProgressData> progressData = [
    LinearProgressData('Canada', 75),
    LinearProgressData('Greenland', 47),
    LinearProgressData('Russia', 82),
  ];

  // revenue data
  final List<RevenueChartData> revenueData = [
    RevenueChartData('Jan', 88.0, 38.00, 12),
    RevenueChartData('Feb', 100.00, 69.00, 16),
    RevenueChartData('Mar', 66.00, 48.00, 4),
    RevenueChartData('Jun', 117.00, 70.00, 20),
    RevenueChartData('Jul', 70.00, 47.00, 22),
    RevenueChartData('Aug', 88.0, 42.00, 9),
    RevenueChartData('Sep', 100.00, 80.00, 5),
    RevenueChartData('Oct', 66.00, 52.00, 28),
    RevenueChartData('Nov', 100.00, 60.00, 19),
    RevenueChartData('Dec', 70.00, 67.00, 32)
  ];
  final TooltipBehavior revenueTooltip = TooltipBehavior(enable: true);

  //statistic - sale progress data
  final List<StatisticChartData> staticData = [
    StatisticChartData(2019, 34.0, 10),
    StatisticChartData(2020, 56.0, 32),
    StatisticChartData(2021, 23.0, 65),
    StatisticChartData(2022, 54.0, 26),
    StatisticChartData(2023, 17.0, 15),
    StatisticChartData(2024, 78.0, 45),
  ];

  final List<StatisticChartData> staticData1 = [
    StatisticChartData(2019, 89.0, 10.0),
    StatisticChartData(2020, 15.0, 76.0),
    StatisticChartData(2021, 34.0, 30.0),
    StatisticChartData(2022, 89.0, 10.0),
    StatisticChartData(2023, 67.0, 32.0),
    StatisticChartData(2024, 34.0, 50.0),
  ];
  final TooltipBehavior staticTooltip = TooltipBehavior(enable: true);

  void _toggleButtonColor(int buttonIndex) {
    setState(() {
      activeButtonIndex = buttonIndex; // Update active button index
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      SizedBox widthSized = WidthSized(sizingInformation.deviceScreenType);
      SizedBox heightSized = HeightSized(sizingInformation.deviceScreenType);

      return ScreenTypeLayout.builder(
        mobile: (BuildContext context) => Column(
          children: [
            _buildRevenueSection(),
            heightSized,
            _buildStatisticsSection()
          ],
        ),
        tablet: (BuildContext context) => Column(
          children: [
            _buildRevenueSection(),
            widthSized,
            _buildStatisticsSection()
          ],
        ),
        desktop: (BuildContext context) => SizedBox(
          height: 550,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: _buildRevenueSection(),
              ),
              const SizedBox(
                width: 32,
              ),
              Expanded(
                flex: 1,
                child: _buildStatisticsSection(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildRevenueSection() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      
      SizedBox heightSized = HeightSized(sizingInformation.deviceScreenType);
      
      return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Revenue",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    CustomTextButton(
                      text: 'All',
                      index: 0,
                      activeIndex: activeButtonIndex,
                      onPressed: _toggleButtonColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomTextButton(
                      text: '1M',
                      index: 1,
                      activeIndex: activeButtonIndex,
                      onPressed: _toggleButtonColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomTextButton(
                      text: '6M',
                      index: 2,
                      activeIndex: activeButtonIndex,
                      onPressed: _toggleButtonColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomTextButton(
                      text: '1Y',
                      index: 3,
                      activeIndex: activeButtonIndex,
                      onPressed: _toggleButtonColor,
                      isDifferentColor: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          RevenueItemCategoryDisplay(),
          heightSized,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RevenueChart(
              data: revenueData,
              tooltip: revenueTooltip,
            ),
          ),
        ],
      ),
    );
    });
    
  }

  Widget _buildStatisticsSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Revenue",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      const Size(20, 30),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.blueColor.withOpacity(.2),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Export Report",
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.greyColor.withOpacity(.2),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatisticChart(
                data: staticData,
                tooltip: staticTooltip,
                data1: staticData1,
              ),
              LinearProgress(data: progressData)
            ],
          ),
        ],
      ),
    );
  }
}
