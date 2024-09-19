import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/widgets/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  void _decreaseCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      int count = _counter = (prefs.getInt('counter') ?? 0);
      if (count > 0) {
        _counter = count - 1;
      }
      prefs.setInt('counter', _counter);
    });
  }

  void _resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      prefs.remove('counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: ColorConstants.lightGreyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ControllerPage(page: 0)));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstants.darkGreyColor,
                      size: 20,
                    ))),
          ),
        ),
        title: const Center(
          child: Text(
            "My cart",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Cart(
                name: 'To Molly From James',
                price: 58,
                quantity: 3,
                category: "Oversize sweater",
                img:
                    'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Promocode",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstants.lightGreyColor,
                  hintText: "Enter promocode",
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
              ),

              const Spacer(), // Pushes the button to the bottom

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$2180",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: ColorConstants.blackColor,
                  shadowColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  minimumSize: const Size.fromHeight(50), // full width
                ),
                child: const Text(
                  "Check out",
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
