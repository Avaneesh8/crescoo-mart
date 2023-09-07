import 'package:flutter/material.dart';

import '../widgets/Top_part.dart';
import '../widgets/top_part_white.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: .200 * MediaQuery.of(context).size.height,
                  child: const Top_part()),
              SizedBox(height: MediaQuery.of(context).size.height*.08),
              const Padding(
                padding:
                EdgeInsets.only(left: 35),
                child: Text(
                  'CAB has booked you, do you want to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.63,
                  ),
                ),
              ),
              Image(width: MediaQuery.of(context).size.width, image: AssetImage('images/map.jpg')),
            ],
          ),
        ),

    );
  }
}
