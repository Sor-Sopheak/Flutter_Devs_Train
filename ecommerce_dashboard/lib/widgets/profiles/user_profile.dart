import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final String? name;
  final String? position;
  const UserProfile({
    super.key,
    required this.image,
    this.width = 36,
    this.height = 36,
    this.name,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        if (name != null &&
            name!.isNotEmpty &&
            position != null &&
            position!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name!,
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  position!,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
