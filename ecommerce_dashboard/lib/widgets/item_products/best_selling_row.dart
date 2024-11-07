import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/constants/form_number.dart';
import 'package:flutter/material.dart';

class BestSellingRow extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String date;
  final double price;
  final int orders;
  final int stock;
  final int amount;
  const BestSellingRow({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.date,
    required this.price,
    required this.orders,
    required this.stock,
    required this.amount,
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
              itemImage,
              width: 60,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                date,
                style:
                    const TextStyle(color: AppColors.greyColor, fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$${price.toString()}",
                style:
                    const TextStyle(color: AppColors.blackColor, fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Price",
                style: TextStyle(color: AppColors.greyColor, fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$orders',
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Orders",
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                decoration: BoxDecoration(
                    color: stock == 0
                        ? AppColors.redColor.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  stock == 0 ? 'Out of stock' : '$stock',
                  style: TextStyle(
                    color:
                        stock == 0 ? AppColors.redColor : AppColors.blackColor,
                    fontSize: stock == 0 ? 12 : 16,
                  ),
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
          if (stock == 0) ...{
            const SizedBox(
              width: 12,
            ),
          } else ...{
            const SizedBox(
              width: 48,
            ),
          },
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$${formatNumber(amount.toString().replaceAll(',', ''))}",
                style:
                    const TextStyle(color: AppColors.blackColor, fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Amount",
                style: TextStyle(color: AppColors.greyColor, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}