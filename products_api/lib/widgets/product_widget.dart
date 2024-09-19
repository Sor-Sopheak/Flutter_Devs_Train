import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/utils/capitalized_extension.dart';

class ProductWidget extends StatefulWidget {
  final String img;
  final String title;
  final String type;
  final double price;
  final bool isFavourite;
  final Function favorite;

  const ProductWidget({
    super.key,
    required this.title,
    required this.type,
    required this.price,
    this.isFavourite = false,
    required this.img,
    required this.favorite,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: ColorConstants.lightGreyColor)),
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.img,
                  fit: BoxFit.fill,
                  height: 250,
                  width: 230,
                ),
              ),
            ),
            Positioned(
                right: 2,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                        widget.favorite();
                      });
                    },
                    icon: Icon(
                      isFavourite
                          ? Icons.favorite_border_rounded
                          : Icons.favorite_rounded,
                      color: isFavourite
                          ? ColorConstants.darkGreyColor
                          : Colors.red,
                      size: 32,
                    ))),
          ],
        ),
        const SizedBox(height: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 230,
              child: Text(
                widget.title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    color: ColorConstants.blackColor,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            Text(
              widget.type.capitalize(),
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: ColorConstants.darkGreyColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              "\$${widget.price}",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  color: ColorConstants.darkGreyColor,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ],
    );
  }
}
