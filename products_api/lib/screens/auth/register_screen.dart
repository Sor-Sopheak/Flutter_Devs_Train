import 'package:flutter/material.dart';
import 'package:products_api/widgets/auth_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/widgets/main_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthTextField(
          hintText: "Username",
          labelText: "Enter username",
          prefixIcon: Icon(Icons.person_2),
        ),
        const SizedBox(height: 15),
        const AuthTextField(
          hintText: "Password",
          labelText: "Enter password",
          prefixIcon: Icon(Icons.lock),
          isPassword: false,
        ),
        const SizedBox(height: 15),
        const AuthTextField(
          hintText: "Password",
          labelText: "Enter confirm password",
          prefixIcon: Icon(Icons.key),
          isPassword: false,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pageController');
                },
                btnText: "Register",
                btnColor: ColorConstants.pinkColor,
                btnTextColor: Colors.white),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(child: Divider()),
            Text("   Or signup with   "),
            Expanded(child: Divider())
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: ElevatedButton.icon(
              onPressed: () {},
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Google",
                  style: TextStyle(color: ColorConstants.blackColor),
                ),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Color.fromARGB(255, 4, 102, 53),
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: ColorConstants.lightGreyColor))),
            )),
            const SizedBox(width: 20),
            Expanded(
                child: ElevatedButton.icon(
              onPressed: () {},
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Facebook",
                  style: TextStyle(color: ColorConstants.blackColor),
                ),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.blueAccent,
              ),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: ColorConstants.lightGreyColor))),
            )),
          ],
        ),
      ],
    );
  }
}
