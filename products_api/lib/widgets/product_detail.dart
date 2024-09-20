import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';

class ProductDetail extends StatefulWidget {
  final String img;
  final String name;
  final String type;
  final double rate;
  final int count;
  final double price;
  final String desc;

  const ProductDetail({
    super.key,
    required this.img,
    required this.name,
    required this.type,
    required this.rate,
    required this.count,
    required this.price,
    required this.desc,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.lightGreyColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Image.network(
            widget.img,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            Text(
              widget.type,
              style: const TextStyle(fontSize: 24, fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star_rate_rounded,
                        color: ColorConstants.blackColor,
                        size: 32,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.count == 1 || widget.count == 0
                        ? "${widget.count} review"
                        : "${widget.count} reviews",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Text(
              "\$ ${widget.price}",
              style: const TextStyle(
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          widget.desc,
          style: TextStyle(fontSize: 22, color: ColorConstants.darkGreyColor),
        ),
      ],
    );
  }
}
