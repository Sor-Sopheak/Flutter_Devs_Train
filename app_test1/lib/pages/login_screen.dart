import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_color/flutter_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //app bar appear over background imgage 
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white //color arrow back
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 24,
                    ),
                    const Text(
                  "Let's Start",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
                ),
                  ],
                ),
                const Text(
                  "Your Trip",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0, //remove shadow
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/login.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('#1B2F30').withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 500,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    decoration: InputDecoration(
                        hintText: 'Enter your username',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 189, 188, 188),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        prefixIcon: const Icon(Icons.person),
                        prefixIconColor:
                            const Color.fromARGB(255, 189, 188, 188),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: HexColor("#192e31")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      obscureText: !passwordVisible,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 189, 188, 188),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor:
                            const Color.fromARGB(255, 189, 188, 188),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: HexColor("#192e31"),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        suffixIconColor:
                            const Color.fromARGB(255, 189, 188, 188),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 201, 149, 70),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 60,
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              child: const Icon(Icons.clear_rounded,
                                  color: Colors.grey),
                            ))
                      ],
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Or login with",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              foregroundColor:
                                  const Color.fromARGB(255, 230, 229, 229),
                              onPressed: () {},
                              child: const FaIcon(
                                FontAwesomeIcons.apple,
                                size: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              foregroundColor:
                                  const Color.fromARGB(255, 230, 229, 229),
                              onPressed: () {},
                              child: const FaIcon(
                                FontAwesomeIcons.google,
                                size: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: FloatingActionButton(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                foregroundColor:
                                    const Color.fromARGB(255, 230, 229, 229),
                                onPressed: () {},
                                child: const FaIcon(
                                  FontAwesomeIcons.facebookF,
                                  size: 22,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Color.fromARGB(255, 201, 149, 70),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Color.fromARGB(255, 201, 149, 70),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
