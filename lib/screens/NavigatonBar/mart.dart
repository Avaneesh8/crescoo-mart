import 'package:crescoo_mart/screens/NavigatonBar/pitches.dart';
import 'package:crescoo_mart/screens/NavigatonBar/profile.dart';
import 'package:crescoo_mart/screens/NavigatonBar/worker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/Top_part.dart';
import '../../widgets/NavBar.dart'; // Import the custom BottomNavBar

class Mart extends StatefulWidget {
  const Mart({Key? key}) : super(key: key);

  @override
  State<Mart> createState() => _MartState();
}

class _MartState extends State<Mart> {
  List<String> categories = [
    "Designing",
    "Hardware",
    "Sanitary",
    "Paints",
    "Tiles",
    "Electrical",
    "Designing",
    "Hardware",
    "Sanitary",
    "Paints",
    "Tiles",
    "Electrical",
  ];

  List<Color> itemColors = [
    Color(0xFF1A3251),
    Color(0xFFFEC95E),
    Color(0xFF4D8BCF),
    Color(0xFFE1BA8B),
    Color(0xFF6DC9FE),
    Color(0xFF823269),
  ];

  String filter = '';
  List<String> filteredCategories = [];

  List<String> itemImages = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
  ];

  int currentIndex = 1; // Set the initial index for Mart

  @override
  void initState() {
    super.initState();
    filteredCategories = categories;
  }

  void filterCategories() {
    setState(() {
      filteredCategories = categories
          .where((category) =>
          category.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: .200 * MediaQuery.of(context).size.height,
            child: Top_part(), // Assuming Top_part is a custom widget for your top section
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text(
              "Mart",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xF3F3F2),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filter = value;
                      filterCategories(); // Call filterCategories to update the filtered list
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Categories',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(26, 50, 81, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          15.heightBox,
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two elements in each row
                      crossAxisSpacing: 30.0, // Spacing between columns
                      mainAxisSpacing: 20.0, // Spacing between rows
                    ),
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle item click here, you can use the 'index' variable
                          // to determine which item was clicked.
                          String selectedCategory = filteredCategories[index];
                          print("Clicked on category: $selectedCategory");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: itemColors[index % itemColors.length], // Repeating colors
                            borderRadius: BorderRadius.circular(35.0), // Square shape
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                filteredCategories[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Example text color
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ), // Spacing between name and line
                              Container(
                                height: 2.0,
                                width: 40,
                                color: Colors.white, // Example line color
                              ),
                              SizedBox(
                                height: 20.0,
                              ), // Spacing between line and image
                              Image.asset(
                                'images/${itemImages[index]}', // Use itemImages list
                                width: 50, // Adjust the width as needed
                                height: 50, // Adjust the height as needed
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Add the BottomNavBar widget at the bottom of the scaffold
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; // Update the current index when an item is tapped
          });

          // Use Navigator to navigate to the corresponding page
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Worker()),
              );
              break;
            case 1:
            // MartPage is already the current page, no need to navigate
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Pitches()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
              break;
          }
        },
      ),
    );
  }
}
