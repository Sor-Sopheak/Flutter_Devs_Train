import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              size: 24,
              color: AppColors.greyColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                onTap: () {
                  
                },
                onChanged: (value) {
                  
                },
                decoration: const InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
