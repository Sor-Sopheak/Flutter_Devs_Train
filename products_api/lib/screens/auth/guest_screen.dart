import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/screens/auth/login_screen.dart';
import 'package:products_api/screens/auth/register_screen.dart';
import 'package:products_api/widgets/main_button.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  int selectedButtonIndex = 0;
  bool? checkValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: true, // Adjusts the body when the keyboard appears
      backgroundColor: ColorConstants.blackColor,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Go ahead and set up your account",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Sign in-up to enjoy the best shopping experience",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: ColorConstants.lightGreyColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorConstants.lightGreyColor),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MainButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedButtonIndex = 0;
                                      });
                                    },
                                    btnText: "Login",
                                    btnColor: selectedButtonIndex == 0
                                        ? Colors.white
                                        : ColorConstants.lightGreyColor,
                                    btnTextColor: selectedButtonIndex == 0
                                        ? ColorConstants.darkGreyColor
                                        : ColorConstants.darkGreyColor
                                            .withOpacity(0.6),
                                    btnShadowColor: Colors.transparent,
                                  ),
                                  MainButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedButtonIndex = 1;
                                      });
                                    },
                                    btnText: "Register",
                                    btnColor: selectedButtonIndex == 1
                                        ? Colors.white
                                        : ColorConstants.lightGreyColor,
                                    btnTextColor: selectedButtonIndex == 1
                                        ? ColorConstants.darkGreyColor
                                        : ColorConstants.darkGreyColor
                                            .withOpacity(0.6),
                                    btnShadowColor: Colors.transparent,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        if (selectedButtonIndex == 0) ...[
                          //... operator = allow insert multiple widget
                          const LoginScreen(),
                          const SizedBox(
                            height: 30,
                          )
                        ] else if (selectedButtonIndex == 1) ...[
                          const RegisterScreen(),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
