import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DateFilter extends StatelessWidget {
  final String startDate;
  final String endDate;
  const DateFilter({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "$startDate to $endDate",
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 24,),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: AppColors.blueColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              ),
            ),
            width: 48,
            
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month,
                  color: AppColors.whiteColor,
                  size: 16,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
