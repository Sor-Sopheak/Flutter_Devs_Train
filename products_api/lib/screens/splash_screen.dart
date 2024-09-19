import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:products_api/screens/auth/guest_screen.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // SharedPreferences prefs = SharedPreferences.getInstance();
  // String token =

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ControllerPage(page: 0)));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GuestScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  Future<Timer> loadSplash() async {
    return Timer(const Duration(seconds: 3), loadToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          "assets/Lottie/Animation - 1726021616450.json",
          fit: BoxFit.cover,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
