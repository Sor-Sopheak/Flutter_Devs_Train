import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/widgets/buttons/button_icon.dart';
import 'package:ecommerce_dashboard/widgets/buttons/button_with_icon_and_title.dart';
import 'package:ecommerce_dashboard/widgets/buttons/date_filter.dart';
import 'package:ecommerce_dashboard/widgets/texts/greeting_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GreetingAndFilterDate extends StatefulWidget {
  const GreetingAndFilterDate({super.key});

  @override
  State<GreetingAndFilterDate> createState() => _GreetingAndFilterDateState();
}

class _GreetingAndFilterDateState extends State<GreetingAndFilterDate> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GreetingText(
            greeting: "Good Morning",
            userName: "Anna",
            description: "Here's what's happening with your store today.",
          ),
          const SizedBox(
            height: 32,
          ),
          const DateFilter(
            startDate: "01 Jan, 2024",
            endDate: "31 Jan, 2024",
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              ButtonWithIconAndTitle(
                text: "Add Product",
                fontSize: 16,
                height: 46,
                icon: const Icon(
                  Icons.add_circle_outline_rounded,
                ),
                action: () {},
              ),
              const SizedBox(
                width: 16,
              ),
              ButtonIcon(
                height: 46,
                width: 46,
                icon: SvgPicture.asset(
                  'assets/icons/analytic.svg',
                ),
                iconColor: AppColors.lightBlueColor,
                backgroundColor: AppColors.lightBlueColor.withOpacity(.2),
              ),
            ],
          ),
        ],
      ),
      tablet: (BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GreetingText(
            greeting: "Good Morning",
            userName: "Anna",
            description: "Here's what's happening with your store today.",
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              const DateFilter(
                startDate: "01 Jan, 2024",
                endDate: "31 Jan, 2024",
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  ButtonWithIconAndTitle(
                    text: "Add Product",
                    fontSize: 16,
                    height: 46,
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                    ),
                    action: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonIcon(
                    height: 46,
                    width: 46,
                    icon: SvgPicture.asset(
                      'assets/icons/analytic.svg',
                    ),
                    iconColor: AppColors.lightBlueColor,
                    backgroundColor: AppColors.lightBlueColor.withOpacity(.2),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      desktop: (BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const GreetingText(
            greeting: "Good Morning",
            userName: "Anna",
            description: "Here's what's happening with your store today.",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DateFilter(
                startDate: "01 Jan, 2024",
                endDate: "31 Jan, 2024",
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  ButtonWithIconAndTitle(
                    text: "Add Product",
                    fontSize: 16,
                    height: 46,
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                    ),
                    action: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonIcon(
                    height: 46,
                    width: 46,
                    icon: SvgPicture.asset(
                      'assets/icons/analytic.svg',
                    ),
                    iconColor: AppColors.lightBlueColor,
                    backgroundColor: AppColors.lightBlueColor.withOpacity(.2),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
