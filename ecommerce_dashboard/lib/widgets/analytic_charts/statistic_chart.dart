import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticChartData {
  final int x; // X-axis value
  final double? y; // Y-axis value for first data set
  final double? y1; // Y-axis value for second data set
  
  StatisticChartData(this.x, this.y, this.y1);
}

class StatisticChart extends StatelessWidget {
  final List<StatisticChartData> data;
  final List<StatisticChartData> data1;
  final TooltipBehavior tooltip;

  const StatisticChart({
    super.key,
    required this.data,
    required this.tooltip,
    required this.data1,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: tooltip,
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: const NumericAxis(
        opposedPosition: false,
        title: AxisTitle(text: 'Y-Axis'),
      ),
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.top,
        iconHeight: 10,
        iconWidth: 10,
        itemPadding: 8,
        overflowMode: LegendItemOverflowMode.wrap,
        alignment: ChartAlignment.center,
      ),
      series: <CartesianSeries>[
        // First SplineSeries
        SplineSeries<StatisticChartData, int>(
          dataSource: data,
          color: AppColors.blueColor,
          legendIconType: LegendIconType.circle,
          markerSettings: const MarkerSettings(isVisible: false),
          name: 'Primary Data',
          xValueMapper: (StatisticChartData data, _) => data.x,
          yValueMapper: (StatisticChartData data, _) => data.y,
        ),
        
        // Second SplineSeries
        SplineSeries<StatisticChartData, int>(
          dataSource: data1,
          color: AppColors.greenColor,
          legendIconType: LegendIconType.circle,
          markerSettings: const MarkerSettings(isVisible: false),
          name: 'Secondary Data', 
          xValueMapper: (StatisticChartData data1, _) => data1.x, 
          yValueMapper: (StatisticChartData data1, _) => data1.y1,
        ),
      ],
    );
  }
}
