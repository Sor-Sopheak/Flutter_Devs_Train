import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/donut_source_chart.dart';
import 'package:ecommerce_dashboard/widgets/analytic_charts/revenue_chart.dart';
import 'package:ecommerce_dashboard/widgets/buttons/button_icon.dart';
import 'package:ecommerce_dashboard/widgets/buttons/button_with_icon_and_title.dart';
import 'package:ecommerce_dashboard/widgets/buttons/custom_text_button.dart';
import 'package:ecommerce_dashboard/widgets/buttons/icon_item.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/dashboard_item.dart';
import 'package:ecommerce_dashboard/widgets/item_products/best_selling_row.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/order_model.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_order_table.dart';
import 'package:ecommerce_dashboard/widgets/item_products/top_seller_row.dart';
import 'package:ecommerce_dashboard/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:ecommerce_dashboard/widgets/texts/greeting_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeContentMobile extends StatefulWidget {
  final String greeting;
  final String userName;
  final String description;
  const HomeContentMobile({
    super.key,
    required this.greeting,
    required this.userName,
    required this.description,
  });

  @override
  State<HomeContentMobile> createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
  int activeButtonIndex = 0; // Track the active button

  void _toggleButtonColor(int buttonIndex) {
    setState(() {
      activeButtonIndex = buttonIndex; // Update active button index
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData('Direct', 25.6),
      ChartData('Social', 32.0),
      ChartData('Email', 23.8),
      ChartData('Other', 9.9),
      ChartData('Referrals', 8.7),
    ];
    final TooltipBehavior tooltip = TooltipBehavior(enable: true);

    final List<String> sourceMenuActions = <String>[
      'Report',
      'Download Report',
      'Export',
      'Import'
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

    String dropdownValue = 'Report';

    Future<List<Map<String, String>>> _loadPage(int page) async {
      // Simulate network delay and return dummy data
      await Future.delayed(const Duration(seconds: 1));
      return List.generate(
        20,
        (index) => {
          'itemName': 'Branded T-Shirt ${index + 1 + (page - 1) * 20}',
          'date': '24 Apr 2021',
          'price': '\$${29.00 + index}',
          'orders': '${62 + index}',
          'stock': '${510 - index}'
        },
      );
    }

    return Scaffold(
      appBar: const NavigationBarMobile(),
      drawer: const Drawer(
          // Add drawer content here
          ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.backgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //greeing text
                  GreetingText(
                    greeting: widget.greeting,
                    userName: widget.userName,
                    description: widget.description,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "01 Jan, 2024 to 31 Jan, 2024",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.blueColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          width: 56,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.calendar_month,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //add icon and open right drawer
                  Row(
                    children: [
                      ButtonWithIconAndTitle(
                        text: "Add Product",
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                        ),
                        action: () {},
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ButtonIcon(
                        icon: SvgPicture.asset(
                          'assets/icons/analytic.svg',
                        ),
                        iconColor: AppColors.lightBlueColor,
                        backgroundColor: AppColors.lightBlueColor,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  DashboardItem(
                    total: 36765098,
                    navigateText: 'View all orders',
                    detail: () {},
                    title: 'Total Earings',
                    totalRate: 3.21,
                    previousRate: 3.54,
                    isNormalNumber: true,
                    icon: iconType.current,
                    backgroundColor: AppColors.greenColor,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DashboardItem(
                    total: 36098,
                    navigateText: 'View all orders',
                    detail: () {},
                    title: 'Total Earings',
                    totalRate: 4.21,
                    previousRate: 3.54,
                    isNormalNumber: false,
                    icon: iconType.shop,
                    backgroundColor: AppColors.lightBlueColor,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DashboardItem(
                    total: 36098,
                    navigateText: 'See details',
                    detail: () {},
                    title: 'Total Earings',
                    totalRate: 3.21,
                    previousRate: 3.21,
                    isNormalNumber: true,
                    icon: iconType.user,
                    backgroundColor: AppColors.yellowColor,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DashboardItem(
                    total: 36098,
                    navigateText: 'View all orders',
                    detail: () {},
                    title: 'Total Earings',
                    totalRate: 8.21,
                    previousRate: 3.54,
                    isNormalNumber: true,
                    icon: iconType.balance,
                    backgroundColor: AppColors.blackColor,
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  Container(
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
                                  color: AppColors.blackColor,
                                  fontSize: 16,
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
                                  CustomTextButton(
                                    text: '1M',
                                    index: 1,
                                    activeIndex: activeButtonIndex,
                                    onPressed: _toggleButtonColor,
                                  ),
                                  CustomTextButton(
                                    text: '6M',
                                    index: 2,
                                    activeIndex: activeButtonIndex,
                                    onPressed: _toggleButtonColor,
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color:
                                    AppColors.backgroundColor.withOpacity(0.2),
                                child: DottedBorder(
                                  customPath: (size) {
                                    return Path()
                                      ..moveTo(
                                          0, 0) // Start at the top-left corner
                                      ..lineTo(
                                          size.width, 0) // Draw the top line
                                      ..moveTo(0,
                                          size.height) // Move to the bottom-left corner
                                      ..lineTo(size.width,
                                          size.height); // Draw the bottom line
                                  },
                                  color: AppColors.backgroundColor,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: const Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "7,585",
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Orders",
                                            style: TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const DottedLine(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.center,
                              lineThickness: 1.5,
                              lineLength: 80,
                              dashLength: 2,
                              dashGapLength: 2,
                              dashColor: AppColors.backgroundColor,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color:
                                    AppColors.backgroundColor.withOpacity(0.2),
                                child: DottedBorder(
                                  customPath: (size) {
                                    return Path()
                                      ..moveTo(
                                          0, 0) // Start at the top-left corner
                                      ..lineTo(
                                          size.width, 0) // Draw the top line
                                      ..moveTo(0,
                                          size.height) // Move to the bottom-left corner
                                      ..lineTo(size.width,
                                          size.height); // Draw the bottom line
                                  },
                                  color: AppColors.backgroundColor,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: const Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "\$22.89k",
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Earnings",
                                            style: TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color:
                                    AppColors.backgroundColor.withOpacity(0.2),
                                child: DottedBorder(
                                  customPath: (size) {
                                    return Path()
                                      ..moveTo(
                                          0, 0) // Start at the top-left corner
                                      ..lineTo(
                                          size.width, 0) // Draw the top line
                                      ..moveTo(0,
                                          size.height) // Move to the bottom-left corner
                                      ..lineTo(size.width,
                                          size.height); // Draw the bottom line
                                  },
                                  color: AppColors.backgroundColor,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: const Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "367",
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Refunds",
                                            style: TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const DottedLine(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.center,
                              lineThickness: 1.5,
                              lineLength: 80,
                              dashLength: 2,
                              dashGapLength: 2,
                              dashColor: AppColors.backgroundColor,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color:
                                    AppColors.backgroundColor.withOpacity(0.2),
                                child: DottedBorder(
                                  customPath: (size) {
                                    return Path()
                                      ..moveTo(
                                          0, 0) // Start at the top-left corner
                                      ..lineTo(
                                          size.width, 0) // Draw the top line
                                      ..moveTo(0,
                                          size.height) // Move to the bottom-left corner
                                      ..lineTo(size.width,
                                          size.height); // Draw the bottom line
                                  },
                                  color: AppColors.backgroundColor,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: const Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "18.92%",
                                            style: TextStyle(
                                                color: AppColors.greenColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Conversation Ratio",
                                            style: TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        RevenueChart(
                          data: revenueData,
                          tooltip: revenueTooltip,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //BEST SELLING PRODUCTS
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Best Selling Products",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "SORT BY:",
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Adjust alignment as needed
                                      children: [
                                        Text(
                                          "Text",
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: AppColors.greyColor,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.greyColor.withOpacity(.5),
                          thickness: 1,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const BestSellingRow(
                                      itemImage:
                                          'assets/images/user_profile.jpg',
                                      itemName: 'One Seater Sofa',
                                      date: '24 Apr 2021',
                                      price: 29,
                                      orders: 62,
                                      stock: 510,
                                      amount: 1797,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const BestSellingRow(
                                      itemImage:
                                          'assets/images/user_profile.jpg',
                                      itemName: 'One Seater Sofa',
                                      date: '24 Apr 2021',
                                      price: 29,
                                      orders: 62,
                                      stock: 510,
                                      amount: 1797,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const BestSellingRow(
                                      itemImage:
                                          'assets/images/user_profile.jpg',
                                      itemName: 'One Seater Sofa',
                                      date: '24 Apr 2021',
                                      price: 29,
                                      orders: 62,
                                      stock: 0,
                                      amount: 1797,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const BestSellingRow(
                                      itemImage:
                                          'assets/images/user_profile.jpg',
                                      itemName: 'One Seater Sofa',
                                      date: '24 Apr 2021',
                                      price: 29,
                                      orders: 62,
                                      stock: 510,
                                      amount: 1797,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const BestSellingRow(
                                      itemImage:
                                          'assets/images/user_profile.jpg',
                                      itemName: 'One Seater Sofa',
                                      date: '24 Apr 2021',
                                      price: 29,
                                      orders: 62,
                                      stock: 0,
                                      amount: 1797,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Showing',
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: ' 5',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: ' of',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: ' 25',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: ' Results',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            //page of products
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    padding: const EdgeInsets.only(
                                        left: 6, right: 6, top: 8, bottom: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back_rounded,
                                      color: AppColors.blueColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.blueColor.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Text(
                                      "1",
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.blueColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Text(
                                      "2",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Text(
                                      "3",
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    padding: const EdgeInsets.only(
                                        left: 6, right: 6, top: 8, bottom: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.blueColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //TOP SELLERS
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Top Sellers",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
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
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.greyColor.withOpacity(.5),
                          thickness: 1,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const TopSellerRow(
                                      shopImage:
                                          'assets/images/user_profile.jpg',
                                      shopeName: 'Digitaltech Galaxy',
                                      sellerName: 'Oliver Tyler',
                                      product: 'Watches',
                                      stock: 896,
                                      price: 98756,
                                      rate: 80,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const TopSellerRow(
                                      shopImage:
                                          'assets/images/user_profile.jpg',
                                      shopeName: 'Digitaltech Galaxy',
                                      sellerName: 'Oliver Tyler',
                                      product: 'Watches',
                                      stock: 896,
                                      price: 98756,
                                      rate: 80,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 600,
                                child: Column(
                                  children: [
                                    const TopSellerRow(
                                      shopImage:
                                          'assets/images/user_profile.jpg',
                                      shopeName: 'Digitaltech Galaxy',
                                      sellerName: 'Oliver Tyler',
                                      product: 'Watches',
                                      stock: 896,
                                      price: 98756,
                                      rate: 80,
                                    ),
                                    Container(
                                      height: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Showing',
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: ' 5',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: ' of',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: ' 25',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: ' Results',
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            //page of products
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    padding: const EdgeInsets.only(
                                        left: 6, right: 6, top: 8, bottom: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back_rounded,
                                      color: AppColors.blueColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.blueColor.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Text(
                                      "1",
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.blueColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Text(
                                      "2",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Text(
                                      "3",
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    padding: const EdgeInsets.only(
                                        left: 6, right: 6, top: 8, bottom: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color:
                                            AppColors.greyColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.blueColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //DONUT CHART
                  Container(
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
                            mainAxisAlignment: MainAxisAlignment.end,
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
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //RECENT ORDER
                  Container(
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
                              const Text(
                                "Recent Orders",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),

                              TextButton.icon(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.whiteColor,
                                  backgroundColor: AppColors.lightBlueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                  )
                                ),
                                icon: const Icon(
                                  Icons.document_scanner_outlined,
                                  size: 12,

                                ),
                                label: const Text(
                                  "Generate Report",
                                  style: TextStyle(
                                      fontSize: 12),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: 700,
                            color: Colors.white,
                            child: RecentOrderTable(
                              orders: [
                                OrderModel(
                                  orderId: "123453",
                                  customerImage:
                                      'assets/images/user_profile.jpg',
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
                                  customerImage:
                                      'assets/images/user_profile.jpg',
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
                                  customerImage:
                                      'assets/images/user_profile.jpg',
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
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
