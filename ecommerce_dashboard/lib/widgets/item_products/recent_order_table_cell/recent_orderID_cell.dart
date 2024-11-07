import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecentOrderidCell extends StatelessWidget {
  final String text;
  const RecentOrderidCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.blueColor,
        ),
      ),
    );
  }
}
