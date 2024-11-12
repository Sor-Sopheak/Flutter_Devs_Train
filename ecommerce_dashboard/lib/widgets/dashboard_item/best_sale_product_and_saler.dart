import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/constraints/sized_box_spacing.dart';
import 'package:ecommerce_dashboard/widgets/item_products/best_selling_row.dart';
import 'package:ecommerce_dashboard/widgets/item_products/top_seller_row.dart';
import 'package:ecommerce_dashboard/widgets/texts/text_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BestSaleProductAndSaler extends StatefulWidget {
  const BestSaleProductAndSaler({super.key});

  @override
  State<BestSaleProductAndSaler> createState() =>
      _BestSaleProductAndSalerState();
}

class _BestSaleProductAndSalerState extends State<BestSaleProductAndSaler> {
  String dropdownValue = 'Report';
  final List<String> sourceMenuActions = <String>[
    'Report',
    'Download Report',
    'Export',
    'Import'
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Column(
        children: [
          _buildBestSellingSection(),
          const SizedBox(
            height: 8,
          ),
          _buildBestSalerSection()
        ],
      ),
      tablet: (BuildContext context) => Column(
        children: [
          _buildBestSellingSection(),
          const SizedBox(
            height: 16,
          ),
          _buildBestSalerSection()
        ],
      ),
      desktop: (BuildContext context) => SizedBox(
        height: 630,
        child: Row(
          children: [
            //best selling products
            Expanded(
              flex: 1,
              child: _buildBestSellingSection(),
            ),
            const SizedBox(
              width: 16,
            ),
            //top sellers
            Expanded(flex: 1, child: _buildBestSalerSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildBestSellingSection() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      TextStyle descriptionStyle =
          descriptionTextStyle(sizingInformation.deviceScreenType);
      TextStyle titleStyle = titleTextStyle(sizingInformation.deviceScreenType);
      HeightSized(sizingInformation.deviceScreenType);

      double widthDevice =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 600
              : (sizingInformation.deviceScreenType == DeviceScreenType.tablet
                  ? 870
                  : 900);

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Best Selling Products",
                    style: titleStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "SORT BY:",
                        style: titleStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Adjust alignment as needed
                          children: [
                            Text("Text", style: descriptionStyle),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
                    width: widthDevice,
                    child: Column(
                      children: [
                        const BestSellingRow(
                          itemImage: 'assets/images/user_profile.jpg',
                          itemName: 'One Seater Sofa',
                          date: '24 Apr 2021',
                          price: 29,
                          orders: 62,
                          stock: 510,
                          amount: 1797,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const BestSellingRow(
                          itemImage: 'assets/images/user_profile.jpg',
                          itemName: 'One Seater Sofa',
                          date: '24 Apr 2021',
                          price: 29,
                          orders: 62,
                          stock: 510,
                          amount: 1797,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const BestSellingRow(
                          itemImage: 'assets/images/user_profile.jpg',
                          itemName: 'One Seater Sofa',
                          date: '24 Apr 2021',
                          price: 29,
                          orders: 62,
                          stock: 0,
                          amount: 1797,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const BestSellingRow(
                          itemImage: 'assets/images/user_profile.jpg',
                          itemName: 'One Seater Sofa',
                          date: '24 Apr 2021',
                          price: 29,
                          orders: 62,
                          stock: 510,
                          amount: 1797,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const BestSellingRow(
                          itemImage: 'assets/images/user_profile.jpg',
                          itemName: 'One Seater Sofa',
                          date: '24 Apr 2021',
                          price: 29,
                          orders: 62,
                          stock: 0,
                          amount: 1797,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
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
                  text: TextSpan(
                    text: 'Showing',
                    style: descriptionStyle,
                    children: [
                      const TextSpan(
                        text: ' 5',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: ' of',
                        style: descriptionStyle,
                      ),
                      const TextSpan(
                        text: ' 25',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: ' Results',
                        style: descriptionStyle,
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
                            color: AppColors.greyColor.withOpacity(.2),
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
                          color: AppColors.blueColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.greyColor.withOpacity(.2),
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
                            color: AppColors.greyColor.withOpacity(.2),
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
                            color: AppColors.greyColor.withOpacity(.2),
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
                            color: AppColors.greyColor.withOpacity(.2),
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
      );
    });
  }

  Widget _buildBestSalerSection() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double widthDevice =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 600
              : (sizingInformation.deviceScreenType == DeviceScreenType.tablet
                  ? 870
                  : 900);

      HeightSized(sizingInformation.deviceScreenType);
      TextStyle descriptionStyle =
          descriptionTextStyle(sizingInformation.deviceScreenType);
      TextStyle titleStyle = titleTextStyle(sizingInformation.deviceScreenType);

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Top Sellers",
                    style: titleStyle,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.greyColor,
                      ),
                      items: sourceMenuActions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: descriptionStyle,
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
                    width: widthDevice,
                    child: Column(
                      children: [
                        const TopSellerRow(
                          shopImage: 'assets/images/user_profile.jpg',
                          shopeName: 'Digitaltech Galaxy',
                          sellerName: 'Oliver Tyler',
                          product: 'Watches',
                          stock: 896,
                          price: 98756,
                          rate: 80,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const TopSellerRow(
                          shopImage: 'assets/images/user_profile.jpg',
                          shopeName: 'Digitaltech Galaxy',
                          sellerName: 'Oliver Tyler',
                          product: 'Watches',
                          stock: 896,
                          price: 98756,
                          rate: 80,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const TopSellerRow(
                          shopImage: 'assets/images/user_profile.jpg',
                          shopeName: 'Digitaltech Galaxy',
                          sellerName: 'Oliver Tyler',
                          product: 'Watches',
                          stock: 896,
                          price: 98756,
                          rate: 80,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const TopSellerRow(
                          shopImage: 'assets/images/user_profile.jpg',
                          shopeName: 'Digitaltech Galaxy',
                          sellerName: 'Oliver Tyler',
                          product: 'Watches',
                          stock: 896,
                          price: 98756,
                          rate: 80,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice,
                    child: Column(
                      children: [
                        const TopSellerRow(
                          shopImage: 'assets/images/user_profile.jpg',
                          shopeName: 'Digitaltech Galaxy',
                          sellerName: 'Oliver Tyler',
                          product: 'Watches',
                          stock: 896,
                          price: 98756,
                          rate: 80,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.greyColor.withOpacity(.5),
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
                  text: TextSpan(
                    text: 'Showing',
                    style: descriptionStyle,
                    children: [
                      const TextSpan(
                        text: ' 5',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: ' of',
                        style: descriptionStyle,
                      ),
                      const TextSpan(
                        text: ' 25',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: ' Results',
                        style: descriptionStyle,
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
                            color: AppColors.greyColor.withOpacity(.2),
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
                          color: AppColors.blueColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.greyColor.withOpacity(.2),
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
                            color: AppColors.greyColor.withOpacity(.2),
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
                            color: AppColors.greyColor.withOpacity(.2),
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
                            color: AppColors.greyColor.withOpacity(.2),
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
      );
    });
  }
}
