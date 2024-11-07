import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final int index;
  final int activeIndex;
  final bool isDifferentColor;
  final Function(int) onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.index,
    required this.activeIndex,
    required this.onPressed, this.isDifferentColor = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = index == activeIndex;

    return TextButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(20, 30),
        ),
        backgroundColor: WidgetStateProperty.all(
          isDifferentColor 
          ? (isActive ? AppColors.blueColor : AppColors.blueColor.withOpacity(.2))
          : (isActive ? AppColors.lightBlueColor : AppColors.lightBlueColor.withOpacity(.2)),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      onPressed: () => onPressed(index),
      child: Text(
        text,
        style: TextStyle(
          color: 
          isDifferentColor 
          ? (isActive ? AppColors.whiteColor : AppColors.blueColor)
          : (isActive ? Colors.white : AppColors.lightBlueColor),
          fontSize: 12,
        ),
      ),
    );   
  }
}
