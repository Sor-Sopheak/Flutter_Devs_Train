import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  final String greeting;
  final String userName;
  final String description;
  const GreetingText(
      {super.key,
      required this.greeting,
      required this.userName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${greeting}, ',
        style: const TextStyle(
            fontSize: 18,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700),
        children: <TextSpan>[
          TextSpan(
            text: '${userName}!',
          ),
          TextSpan(
            text: '\n${description}',
            style: const TextStyle(
              fontSize: 14,
              height: 2,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
