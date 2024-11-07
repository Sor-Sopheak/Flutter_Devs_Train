enum Status { paid, unpaid, pending }

class OrderModel {
  final String orderId;
  final String customerImage;
  final String customerName;
  final String product;
  final double amount;
  final String vendor;
  final double rating;
  final int vote;
  final Status status;

  OrderModel({
    required this.orderId,
    required this.customerImage,
    required this.customerName,
    required this.product,
    required this.amount,
    required this.vendor,
    required this.rating,
    required this.vote,
    required this.status,
  });
}