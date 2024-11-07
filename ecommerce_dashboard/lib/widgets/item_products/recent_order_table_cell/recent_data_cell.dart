import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecentDataCell extends StatelessWidget {
  final String text;
  const RecentDataCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
