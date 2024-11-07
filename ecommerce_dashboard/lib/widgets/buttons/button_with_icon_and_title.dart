import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIconAndTitle extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback? action;
  final double? width;
  final double? height;
  const ButtonWithIconAndTitle({
    super.key,
    required this.text,
    required this.icon,
    this.action,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: action,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: width ?? double.infinity,
          ),
          height: height,
          decoration: BoxDecoration(
            color: AppColors.greenColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon.icon,
                color: AppColors.greenColor, 
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
