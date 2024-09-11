import 'package:flutter/material.dart';
import 'package:products_api/widgets/auth_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthTextField(
          hintText: "Username",
          labelText: "Enter your username",
          prefixIcon: Icon(Icons.person_2),
        ),
        const SizedBox(height: 15),
        const AuthTextField(
          hintText: "Password",
          labelText: "Enter your password",
          prefixIcon: Icon(Icons.lock),
          isPassword: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: checkValue,
                  onChanged: (bool? newCheckValue) {
                    setState(() {
                      checkValue = newCheckValue;
                    });
                  },
                  checkColor: ColorConstants.pinkColor,
                  activeColor: ColorConstants.darkGreyColor,
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return ColorConstants.lightGreyColor;
                    }
                    return ColorConstants.lightGreyColor;
                  }),
                ),
                const Text("Remember me")
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: ColorConstants.pinkColor),
                ))
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                btnText: "Login",
                btnColor: ColorConstants.pinkColor,
                btnTextColor: Colors.white),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(child: Divider()),
            Text("   Or login with   "),
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
