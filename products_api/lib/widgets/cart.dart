import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';

class Cart extends StatefulWidget {
  final String img;
  final String name;
  final double price;
  final int quantity;
  final String category;
  // final Function onDelete;
  // final Function decrease;
  // final Function increase;

  const Cart(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity,
      required this.img,
      required this.category});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.name), // Unique key for the item
      direction: DismissDirection.endToStart, // Enable swipe to the left
      background: Container(
        padding: const EdgeInsets.only(right: 16),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {
        // Call the delete function when swiped
        // widget.onDelete();
      },
      child: Column(
        children: [
          Row(
            children: [
              // Product image
              Image.network(
                widget.img,
                fit: BoxFit.fill,
                height: 130,
                width: 110,
              ),
      
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "\$${widget.price}",
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
      
                      Text(
                        widget.category,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ColorConstants.darkGreyColor,
                        ),
                      ),
      
                      const SizedBox(height: 20),
                      // Quantity control buttons
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            color: ColorConstants.lightGreyColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //minus
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              const SizedBox(width: 8),
                              //quatity
                              Text(
                                widget.quantity.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 8),
                              // Add button
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.add)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const Divider(),
        ],
      ),
    );
  }
}
