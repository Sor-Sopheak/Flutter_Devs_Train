import 'package:flutter/material.dart';
import 'package:products_api/models/login.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/services/auth.api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/widgets/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? checkValue = false;

  GlobalKey<FormState> globalFormKey =
      GlobalKey<FormState>(); //form key to manage form state
  late LoginRequest authRequest;
  final AuthAPI _authAPI = AuthAPI();
  bool _isLogin = false;

  void saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
    authRequest = LoginRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalFormKey,
      child: Column(
        children: [
          // const AuthTextField(
          //   hintText: "Username",
          //   labelText: "Enter your username",
          //   prefixIcon: Icon(Icons.person_2),
          // ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.person_3_outlined),
                hintText: "Username",
                labelText: "Enter your username"),
            onSaved: (input) => authRequest.username = input,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // const AuthTextField(
          //   hintText: "Password",
          //   labelText: "Enter your password",
          //   prefixIcon: Icon(Icons.lock),
          //   isPassword: true,
          // ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.lock_outline_rounded),
                hintText: "Password",
                labelText: "Enter your password"),
            obscureText: true,
            onSaved: (input) => authRequest.password = input,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
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
              _isLogin
                  ? const Center(child: CircularProgressIndicator())
                  : MainButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          setState(() {
                            _isLogin = true;
                          });

                          AuthAPI.login(authRequest).then((loginResponse) {
                            setState(() {
                              _isLogin = false;
                            });

                            if (loginResponse.token.isNotEmpty) {
                              saveToken(loginResponse.token);
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const ControllerPage(page: 0)));
                            } else {
                              print("Login failed: ${loginResponse.error}");
                            }
                          });
                        }
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
                        side:
                            BorderSide(color: ColorConstants.lightGreyColor))),
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
                        side:
                            BorderSide(color: ColorConstants.lightGreyColor))),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
