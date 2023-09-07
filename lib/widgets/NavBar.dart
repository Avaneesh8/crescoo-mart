import 'package:crescoo_mart/screens/profile.dart';
import 'package:flutter/material.dart';

import '../screens/Home.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    Home(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(189, 189, 199, 1),
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: Material(
          //elevation: 100.0,// Add elevation to make it pop out
          child: Container(
            color: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                color: Color(0xFF1A3251),// Change the color here
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xFF1A3251),
                  unselectedItemColor: Colors.black,
                  onTap: ((value) {
                    setState(() => _currentIndex = value);
                  }),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
