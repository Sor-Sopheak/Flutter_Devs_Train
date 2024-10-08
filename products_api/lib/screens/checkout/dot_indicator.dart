import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/screens/checkout/confirmation_page.dart';
import 'package:products_api/screens/checkout/payment_screen.dart';
import 'package:products_api/screens/checkout/shipping_screen.dart';

class DotIndicator extends StatefulWidget {
  const DotIndicator({super.key});

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Widget> _pages = [
    const ShippingScreen(),
    const PaymentScreen(),
    const ConfirmationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: ColorConstants.lightGreyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorConstants.darkGreyColor,
                  size: 20,
                )
              )
            ),
          ),
        ),
        title: Column(
          children: [
            const Text('Checkout'),
            const SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        _activePage == index ? ColorConstants.blackColor : Colors.grey,
                  ),
                ),
              )
            )
          ],
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _activePage = page;
          });
        },
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index % _pages.length];
        }
      ),
    );
  }
}
