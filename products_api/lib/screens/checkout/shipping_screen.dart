import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/user.dart';
import 'package:products_api/services/auth.api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  User? _user;
  bool _isLoadingProfile = true;

  Map<String, dynamic>? decodedToken;

  @override
  void initState() {
    super.initState();

    loadAndToken();
  }

  @override
  void dispose() {
    super.activate();
  }

  Future<void> getOneUser(int id) async {
    _user = await AuthAPI.getOneUser(id);
    setState(() {
      _isLoadingProfile = false;
    });
  }

  Future<void> loadAndToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      Map<String, dynamic> decoded = decodeToken(token);
      int userId = decoded['sub'];

      setState(() {
        decodedToken = decoded;
      });

      await getOneUser(userId);
    } else {
      setState(() {
        _isLoadingProfile = false;
      });
    }
  }

  Map<String, dynamic> decodeToken(String token) {
    final splitToken = token.split('.');
    if (splitToken.length != 3) {
      throw Exception('Invalid token format');
    }

    try {
      final payloadBase64 = splitToken[1];
      final normalizedPayload = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      final decodedPayload = jsonDecode(payloadString);
      return decodedPayload;
    } catch (e) {
      throw const FormatException('Invalid payload');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Shipping",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 16),

              _isLoadingProfile 
                ? const CircularProgressIndicator()
                : Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: ColorConstants.lightGreyColor.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: ColorConstants.darkGreyColor,
                                  size: 32,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_user!.address?.zipcode} ${_user!.address?.city}",
                              style: TextStyle(
                                  color: ColorConstants.darkGreyColor,
                                  fontSize: 18,
                                  fontFamily: 'Poppins'),
                            ),

                            Text(
                              "${_user!.address?.street}, ${_user!.address?.number}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Poppins'
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: ColorConstants.blackColor,
            shadowColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          child: const Text(
            "Continue to Payment",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
