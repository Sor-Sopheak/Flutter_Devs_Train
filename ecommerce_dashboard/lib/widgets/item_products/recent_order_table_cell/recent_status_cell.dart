import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/order_model.dart';
import 'package:flutter/material.dart';

class RecentStatusCell extends StatelessWidget {
  final Status status;
  const RecentStatusCell({super.key, required this.status});

  @override
   Widget build(BuildContext context) {
    Color bgColor;
    String text;

    switch (status) {
      case Status.paid:
        bgColor = Colors.green.withOpacity(0.2);
        text = 'Paid';
        break;
      case Status.unpaid:
        bgColor = Colors.red.withOpacity(0.2);
        text = 'Unpaid';
        break;
      default:
        bgColor = Colors.yellow.withOpacity(0.2);
        text = 'Pending';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: bgColor.withOpacity(1.0),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
  // Widget build(BuildContext context) {
  //   // Customize widget appearance based on status
  //   return Container(
  //     padding: const EdgeInsets.all(8.0),
  //     decoration: BoxDecoration(
  //       color: _getStatusColor(),
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     child: Text(
  //       _getStatusText(),
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }

  // Color _getStatusColor() {
  //   switch (status) {
  //     case Status.paid:
  //       return Colors.green;
  //     case Status.unpaid:
  //       return Colors.red;
  //     case Status.pending:
  //       return Colors.orange;
  //   }
  // }

  // String _getStatusText() {
  //   switch (status) {
  //     case Status.paid:
  //       return 'Paid';
  //     case Status.unpaid:
  //       return 'Unpaid';
  //     case Status.pending:
  //       return 'Pending';
  //   }
  // }
// }