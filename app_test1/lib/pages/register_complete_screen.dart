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
              mainAxisAlignment: MainAxisAlignment.start,
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
                Container(
                  decoration: BoxDecoration(
                    color: HexColor('#1B2F30').withOpacity(0.8),
                  ),
                  height: 500,
                  padding: const EdgeInsets.all(16),
                  child: Column(
  children: [
    Container(
      width: 140, // Diameter of the outermost circle
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.blue,  // Start color of the gradient
            Colors.purple // End color of the gradient
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: CircleAvatar(
          radius: 55, // Middle circle
          backgroundColor: Colors.green, // Second background color
          child: CircleAvatar(
            radius: 50, // Innermost circle for the image
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
      ),
    ),
  ],
)

                //   child: const Column(children: [
                //     CircleAvatar(
                //       radius: 70, // Outermost circle (largest)
                //       // backgroundColor: GradientRotation(radians), // First background color
                //       child: CircleAvatar(
                //         radius: 55, // Middle circle
                //         backgroundColor:
                //             Colors.green, // Second background color
                //         child: CircleAvatar(
                //           radius: 50, // Innermost circle (where the image goes)
                //           backgroundImage:
                //               AssetImage('assets/images/profile.png'),
                //         ),
                //       ),
                //     )
                //   ]
                // ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
