import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TopSellerRow extends StatelessWidget {
  final String shopImage;
  final String shopeName;
  final String sellerName;
  final String product;
  final int stock;
  final double price;
  final double rate;
  const TopSellerRow({
    super.key,
    required this.shopImage,
    required this.shopeName,
    required this.sellerName,
    required this.product,
    required this.stock,
    required this.price,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              shopImage,
              width: 60,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shopeName,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                sellerName,
                style:
                    const TextStyle(color: AppColors.greyColor, fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            width: 14,
          ),
          Text(
            product,
            style: const TextStyle(
              color: AppColors.greyColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$stock',
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Stock",
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 14,
          ),
          Text(
            "\$${price.toString()}",
            style: const TextStyle(color: AppColors.greyColor, fontSize: 14),
          ),
          const SizedBox(
            width: 14,
          ),
          Row(
            children: [
              Text(
                "$rate\%",
                style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const Icon(
                Icons.analytics_outlined,
                color: AppColors.greenColor,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
