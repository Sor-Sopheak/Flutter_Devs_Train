import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';

class ProductTitle extends StatelessWidget {
  final String title;

  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              color: ColorConstants.blackColor,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: ColorConstants.lightGreyColor,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorConstants.darkGreyColor,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
