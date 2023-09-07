import 'package:flutter/material.dart';

import '../widgets/Top_part.dart';
import '../widgets/top_part_white.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: .200 * MediaQuery.of(context).size.height,
                    child: const Top_part()),
                SizedBox(height: MediaQuery.of(context).size.height * .08),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: MediaQuery.of(context).size.height * .45,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE0DEDE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(10, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(55.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Employee",
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Icon(Icons.edit),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cleaner",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Male",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "+91123456789",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "69",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "40",
                                style: TextStyle(fontSize: 55),
                              ),
                              Text(
                                "Years of Experience",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Per Hour:200",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Per Day:1000",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
