import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecentRatingCell extends StatelessWidget {
  final double rating;
  final int votes;
  const RecentRatingCell(
      {super.key, required this.rating, required this.votes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: RichText(
        text: TextSpan(
          text: '${rating.toString()} ',
          style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
          children: [
            TextSpan(
              text: '(${votes.toString()} ',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyColor
              ),
            ),
            const TextSpan(
              text: 'votes)',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
