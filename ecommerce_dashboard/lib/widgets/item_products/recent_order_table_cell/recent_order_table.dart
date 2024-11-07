// import 'package:ecommerce_dashboard/widgets/item_products/table_cell/order_model.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/order_model.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_amount_cell.dart';

import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_customer_cell.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_data_cell.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_header_cell.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_orderID_cell.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_rating_cell.dart';
import 'package:ecommerce_dashboard/widgets/item_products/recent_order_table_cell/recent_status_cell.dart';
import 'package:flutter/material.dart';

class RecentOrderTable extends StatelessWidget {
  final List<OrderModel> orders;
  RecentOrderTable({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: IntrinsicColumnWidth(),
        4: IntrinsicColumnWidth(),
        5: IntrinsicColumnWidth(),
        6: IntrinsicColumnWidth(),
      },
      children: [
        //HEADER ROW
        const TableRow(
          children: [
            RecentHeaderCell(text: 'Order ID'),
            RecentHeaderCell(text: 'Customer'),
            RecentHeaderCell(text: 'Product'),
            RecentHeaderCell(text: 'Amount'),
            RecentHeaderCell(text: 'Vendor'),
            RecentHeaderCell(text: 'Status'),
            RecentHeaderCell(text: 'Rating'),
          ],
        ),
        // Data rows
        for (var order in orders) _buildDataRow(order),
      ],
    );
  }

  TableRow _buildDataRow(OrderModel order) {
    return TableRow(
      children: [
        RecentOrderidCell(text: "#${order.orderId}"),
        RecentCustomerCell(imagePath: order.customerImage, name: order.customerName),
        RecentDataCell(text: order.product),
        RecentAmountCell(amount: order.amount),
        RecentDataCell(text: order.vendor),
        RecentStatusCell(status: order.status),
        RecentRatingCell(rating: order.rating, votes: order.vote),
      ],
    );
  }
}