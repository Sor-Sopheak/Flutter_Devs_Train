import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    // final List imgList = [
    //   Image.asset('assets/images/angkor_wat.jpg'),
    //   Image.asset('assets/images/angkor_wat.jp'),
    //   Image.asset('assets/images/angkor_wat.jp'),
    //   Image.asset('assets/images/angkor_wat.jp'),
    // ];

    return Scaffold(
        backgroundColor: HexColor('#1B2F30').withOpacity(0.8),
        body: SafeArea(
          child: Column(
            children: [
              //profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            "Evelyn",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        size: 32,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ))
                ],
              ),

              // const SizedBox(height: 30),

              //search
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommendation",
                    style: TextStyle(
                      color: Color.fromARGB(255, 201, 149, 70),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Color.fromARGB(255, 201, 149, 70),
                    )
                  ),
                ],
              ),

              Divider(
                color:
                    const Color.fromARGB(255, 233, 192, 105).withOpacity(0.5),
                height: 1,
              ),

              Column(
                children: [
                  Row(
                    children: [
                      // First column (20% of screen width)
                      Flexible(
                        flex: 2, // 2 parts of total 10 (20%)
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentSelected =
                                          0; // Set to index 0 when this button is pressed
                                    });
                                  },
                                  child: RotatedBox(
                                    quarterTurns:
                                        3, // Rotates the text 90 degrees counterclockwise per quarter turn
                                    child: Text(
                                      "Destination",
                                      style: TextStyle(
                                          color: _currentSelected == 0
                                              ? const Color.fromARGB(
                                                  255, 233, 192, 105)
                                              : Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentSelected = 1;
                                    });
                                  },
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      "Countries",
                                      style: TextStyle(
                                        color: _currentSelected == 1
                                            ? const Color.fromARGB(
                                                255, 233, 192, 105)
                                            : Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentSelected = 2;
                                    });
                                  },
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      "Cities",
                                      style: TextStyle(
                                        color: _currentSelected == 2
                                            ? const Color.fromARGB(
                                                255, 233, 192, 105)
                                            : Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),

                      Flexible(
                        flex: 8,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(15),
                                width: 200,
                                height: 300,
                                color: Colors.amber,
                                alignment: Alignment.center,
                                child: const Text(
                                  '1',
                                  style: TextStyle(fontSize: 80),
                                )
                              ),
                              Container(
                                margin: const EdgeInsets.all(15),
                                width: 200,
                                height: 300,
                                color: Colors.amber,
                                alignment: Alignment.center,
                                child: const Text(
                                  '2',
                                  style: TextStyle(fontSize: 80),
                                )
                              ),
                              Container(
                                margin: const EdgeInsets.all(15),
                                width: 200,
                                height: 300,
                                color: Colors.amber,
                                alignment: Alignment.center,
                                child: const Text(
                                  '3',
                                  style: TextStyle(fontSize: 80),
                                )
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
