import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/screens/auth/guest_screen.dart';
import 'package:products_api/screens/controller_page.dart';
import 'package:products_api/screens/detail_screen.dart';
import 'package:products_api/screens/home_screen.dart';
import 'package:products_api/screens/auth/login_screen.dart';
import 'package:products_api/screens/auth/register_screen.dart';
import 'package:products_api/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.blackColor),
        useMaterial3: true,
      ),
      
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/guest': (context) => const GuestScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/pageController': (context) => const ControllerPage()
      },
    );
  }
}
