import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueChartData {
  RevenueChartData(this.x, this.y, this.y1, this.y2);

  final String x;
  final double y; // revenue
  final double y1; // orders
  final double y2; // refunds
}

class RevenueChart extends StatelessWidget {
  final List<RevenueChartData> data;
  final TooltipBehavior tooltip;

  const RevenueChart({
    super.key,
    required this.data,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: const NumericAxis(
        minimum: 0,
        maximum: 120,
        interval: 20,
      ),
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        iconHeight: 10,
        iconWidth: 10,
        itemPadding: 8,
        overflowMode: LegendItemOverflowMode.wrap,
        alignment: ChartAlignment.center,
      ),
      tooltipBehavior: tooltip,
      series: <CartesianSeries<RevenueChartData, String>>[
        

        // RangeAreaSeries to create a background below the line for orders
        RangeAreaSeries<RevenueChartData, String>(
          dataSource: data,
          xValueMapper: (RevenueChartData data, _) => data.x,
          lowValueMapper: (RevenueChartData data, _) => 0,
          highValueMapper: (RevenueChartData data, _) => data.y1,
          color: AppColors.blueColor.withOpacity(0.1),
          borderColor: Colors.transparent,
          name: 'Order Background',
          isVisibleInLegend: false,
        ),

        // StackedLineSeries for the orders line chart
        StackedLineSeries<RevenueChartData, String>(
          dataSource: data,
          xValueMapper: (RevenueChartData data, _) => data.x,
          yValueMapper: (RevenueChartData data, _) => data.y1,
          color: AppColors.blueColor,
          width: 2,
          markerSettings: const MarkerSettings(isVisible: false),
          name: 'Orders',
          legendIconType: LegendIconType.circle,
          
        ),

        ColumnSeries<RevenueChartData, String>(
          dataSource: data,
          xValueMapper: (RevenueChartData data, _) => data.x,
          yValueMapper: (RevenueChartData data, _) => data.y,
          name: 'Earnings',
          color: AppColors.greenColor.withOpacity(.8),
          legendIconType: LegendIconType.circle,
        ),

        // LineSeries for the dotted line for refunds
        LineSeries<RevenueChartData, String>(
          dataSource: data,
          xValueMapper: (RevenueChartData data, _) => data.x,
          yValueMapper: (RevenueChartData data, _) => data.y2,
          color: AppColors.redColor,
          dashArray: const [5, 5], // Creates a dotted line pattern
          width: 2,
          markerSettings: const MarkerSettings(isVisible: false),
          name: 'Refunds',
          legendIconType: LegendIconType.circle,
        ),
      ],
    );
  }
}
