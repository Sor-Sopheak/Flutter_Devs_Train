import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIcon extends StatelessWidget {
  final Widget icon; //accept any types of icons
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? action;
  final double? height;
  final double? width;
  const ButtonIcon(
      {super.key,
      required this.icon,
      this.action,
      this.height,
      this.width,
      required this.iconColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: action,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          constraints: BoxConstraints(
            minWidth: 36,
            maxWidth: width ?? double.infinity,
          ),
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: icon is SvgPicture // Check if the icon is a SvgPicture
              ? SizedBox(
                  width: 14,
                  height: 14,
                  child: icon, // Use the provided icon as a child
                )
              : Icon(
                  (icon as Icon).icon, // Cast to Icon
                  color: iconColor,
                  size: 14,
                ),
        ),
      ),
    );
  }
}
