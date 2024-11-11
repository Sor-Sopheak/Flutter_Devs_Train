import 'dart:math';

import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressData {
  final String title;
  final double value;

  LinearProgressData(this.title, this.value);
}

class LinearProgress extends StatefulWidget {
  final List<LinearProgressData> data;
  const LinearProgress({
    super.key,
    required this.data,
  });

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  final List<Color> colors = [
    AppColors.blueColor,
    AppColors.greenColor,
    AppColors.lightBlueColor,
  ];
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.map((progressData) {
        int colorIndex = random.nextInt(colors.length);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        progressData.title,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12,
                        ),
                      ),
                    Text(
                        "${progressData.value}%",
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 5.0,
                          percent: (progressData.value / 100).clamp(0.0, 1.0),
                          barRadius: const Radius.circular(16),
                          progressColor: colors[colorIndex],
                          backgroundColor: AppColors.backgroundColor,
                        ),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        );
      }).toList(),
    );
  }
}
