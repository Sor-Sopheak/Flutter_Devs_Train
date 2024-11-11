import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIconAndTitle extends StatefulWidget {
  final String text;
  final Icon icon;
  final VoidCallback? action;
  final double? width;
  final double? height;
  final double? fontSize;
  const ButtonWithIconAndTitle({
    super.key,
    required this.text,
    required this.icon,
    this.action,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  State<ButtonWithIconAndTitle> createState() => _ButtonWithIconAndTitleState();
}

class _ButtonWithIconAndTitleState extends State<ButtonWithIconAndTitle> {
  Color _backgroundColor = AppColors.greenColor.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    bool isHovering=false;
    return Material(
      child: InkWell(
        
        onTap:  widget.action,
        onHover: (hovering) {
          setState(() {
            setState(() => isHovering = hovering);
          });
        },
        // splashColor: AppColors.redColor,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: widget.width ?? double.infinity,
          ),
          height: widget.height,
          decoration: BoxDecoration(
            color: isHovering ? AppColors.redColor : AppColors.greenColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon.icon,
                  color: AppColors.greenColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
