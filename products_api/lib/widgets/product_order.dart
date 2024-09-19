import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/utils/capitalized_extension.dart';

class ProductOrder extends StatefulWidget {
  final String img;
  final String? promo;
  final String type;
  final String name;

  const ProductOrder(
      {super.key,
      required this.img,
      this.promo,
      required this.type,
      required this.name});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: ColorConstants.lightGreyColor,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.img,
                fit: BoxFit.fill,
                height: 140,
                width: 120,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: widget.promo != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,

              mainAxisAlignment: widget.promo != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              
              children: [
                if (widget.promo != null)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: ColorConstants.pinkColor,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: Text(
                        widget.promo!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.type.capitalize(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 170,
                      child: Text(
                        widget.name.capitalize(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
