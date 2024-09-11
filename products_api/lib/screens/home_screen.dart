import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:products_api/constants/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          // title: Text(
          //   'Title',
          // ),
          // centerTitle: true,
          elevation: 0,
          actions: [
            Row(
              children: [
                const CupertinoSearchTextField(),
                Container(
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.bolt),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
