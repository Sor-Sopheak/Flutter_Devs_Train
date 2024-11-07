import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecentAmountCell extends StatelessWidget {
  final double amount;
  const RecentAmountCell({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(
        "\$${amount.toString()}",
        style: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 14,
        ),
      ),
    );
  }
}