// donut_source_chart.dart
import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  // <-- Removed underscore to make it public
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class DonutSourceChart extends StatelessWidget {
  final List<ChartData> data;
  final TooltipBehavior tooltip;

  const DonutSourceChart({
    Key? key,
    required this.data,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in data) {
      total += item.y;
    }

    return Center(
      child: SfCircularChart(
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        tooltipBehavior: tooltip,
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelIntersectAction: LabelIntersectAction.none,
              labelAlignment: ChartDataLabelAlignment.middle,
              connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.curve,
              ),
              builder: (data, point, series, pointIndex, seriesIndex) {
                final percentage = (data.y / total * 100).toStringAsFixed(1);
                return Text(
                  '$percentage%', // Display the percentage
                  style: const TextStyle(color: AppColors.whiteColor),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
