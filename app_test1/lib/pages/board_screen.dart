import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/onboard.jpg",
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,  // make this column display bottom of the screen 
              crossAxisAlignment: CrossAxisAlignment.start, // all content display start of the screen
              children: [
                const Text(
                  "Explore the beauty of the world!",
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1
                  ),
                ),

                const SizedBox(height: 5),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100.0,
                      child: Text(
                        "Lorem Ipsum dummy text.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 1.5
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 201, 149, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        elevation: 4.0
                      ), 
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}