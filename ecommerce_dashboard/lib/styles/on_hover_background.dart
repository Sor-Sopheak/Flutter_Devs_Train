import 'package:flutter/material.dart';

class OnHoverBackground extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const OnHoverBackground({
    super.key,
    required this.builder,
  });

  @override
  State<OnHoverBackground> createState() => _OnHoverBackgroundState();
}

class _OnHoverBackgroundState extends State<OnHoverBackground> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      cursor: SystemMouseCursors.text,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}