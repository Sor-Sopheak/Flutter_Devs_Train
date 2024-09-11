import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {

  final String btnText;
  final Function onPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color btnColor;
  final Color btnTextColor;
  final Color? btnShadowColor;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.btnText,
    this.leftIcon,
    this.rightIcon,
    required this.btnColor,
    required this.btnTextColor,
    this.btnShadowColor
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          backgroundColor: btnColor,
          shadowColor: btnShadowColor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            btnText,
            style: TextStyle(
              color: btnTextColor
            ),
          ),
        )
      )
    );
  }
}