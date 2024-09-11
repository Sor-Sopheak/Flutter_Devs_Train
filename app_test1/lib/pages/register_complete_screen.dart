import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_color/flutter_color.dart';

class RegisterCompleteScreen extends StatelessWidget {
  const RegisterCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/register_complete.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.7,
                  child: const Column(
                    children: [
                      Text(
                        "Registere Complete!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 46),
                      ),
                      Text(
                        "In publishing and graphic design, Lorem ipsum is a placeholder text",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Container(
                    decoration: BoxDecoration(
                      color: HexColor('#1B2F30').withOpacity(0.8),
                    ),
                    height: 450,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),

                        const Center(
                          child: CircleAvatar(
                            radius: 62,
                            backgroundColor: Color.fromARGB(
                                255, 233, 192, 105),
                            child: CircleAvatar(
                              radius: 60, 
                              backgroundImage:
                                  AssetImage('assets/images/profile.png'),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        const Text(
                          "Evelyn",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        const SizedBox(height: 90),

                        Row(             
                                
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/home');
                                  }, 
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    backgroundColor: const Color.fromARGB(255, 201, 149, 70),
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "Complete",
                                    style: TextStyle(
                                      fontSize: 16
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
