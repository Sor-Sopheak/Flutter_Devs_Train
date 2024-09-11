import 'package:app_test1/pages/board_screen.dart';
import 'package:app_test1/pages/home_screen.dart';
import 'package:app_test1/pages/login_screen.dart';
import 'package:app_test1/pages/register_complete_screen.dart';
import 'package:app_test1/pages/signup_screen.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BoardScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/signupComplete': (context) => const RegisterCompleteScreen(),
        '/home': (context) => const HomeScreen()
      },
    );
  }
}

