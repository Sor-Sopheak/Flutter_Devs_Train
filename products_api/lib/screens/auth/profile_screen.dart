import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/user.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/services/auth.api.dart';
import 'package:products_api/utils/capitalized_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Map<String, dynamic> decodeToken(String token) {
    final splitToken = token.split('.');
    if (splitToken.length != 3) {
      throw Exception('Invalid token format');
    }

    try {
      final payloadBase64 = splitToken[1]; // Payload is always the index 1
      // Base64 should be multiple of 4. Normalize the payload before decode it
      final normalizedPayload = base64.normalize(payloadBase64);
      // Decode payload, the result is a String
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      // Parse the String to a Map<String, dynamic>
      final decodedPayload = jsonDecode(payloadString);
      return decodedPayload;
    } catch (e) {
      throw const FormatException('Invalid payload');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: ColorConstants.lightGreyColor
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ControllerPage(page: 0)
                                        )
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: ColorConstants.darkGreyColor,
                                      size: 20,
                                    )),
                              ),
                            ),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: ColorConstants.lightGreyColor
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.popAndPushNamed(
                                        context, '/PagepageController');
                                  },
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: ColorConstants.darkGreyColor,
                                    size: 22,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                "https://thekawaiifactory.com/cdn/shop/files/S64ef4db4cc7643a1919104b3e9fe215cd_530x@2x.jpg?v=1688011625",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${_user?.name?.firstname?.capitalize() ?? ''} ${_user?.name?.lastname?.capitalize() ?? ''}',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                                Text(
                                  'Fashion Model',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.phone),
                                const SizedBox(width: 16),
                                Text(
                                  _user!.phone ?? '',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.email_outlined),
                                const SizedBox(width: 16),
                                Text(
                                  _user!.email ?? '',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400)),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '\$140.00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Wallet',
                                    style: TextStyle(
                                        color: ColorConstants.darkGreyColor,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              const VerticalDivider(
                                thickness: 1,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '12',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Orders',
                                    style: TextStyle(
                                        color: ColorConstants.darkGreyColor,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.38,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_border_rounded),
                                const SizedBox(width: 16),
                                Text(
                                  'Your Favorites',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                    Icons.account_balance_wallet_outlined),
                                const SizedBox(width: 16),
                                Text(
                                  'Payment',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.people_alt_outlined),
                                const SizedBox(width: 16),
                                Text(
                                  'Tell Your Friend',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const FaIcon(FontAwesomeIcons.tag),
                                const SizedBox(width: 16),
                                Text(
                                  'Promotions',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.settings),
                                const SizedBox(width: 16),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                      color: ColorConstants.darkGreyColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () =>
                                    {removeToken(), print("log out click")},
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.power_settings_new_rounded,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      'Log out',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    )
                                  ],
                                )),
                            const SizedBox(height: 35)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }),
    ));
  }
}
