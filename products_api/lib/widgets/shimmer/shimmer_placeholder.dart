import 'package:flutter/material.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerPlaceholder({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
    );
  }
}
