import 'package:crescoo_mart/screens/NavigatonBar/pitches.dart';
import 'package:crescoo_mart/screens/NavigatonBar/profile.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/NavBar.dart';
import '../../widgets/Top_part.dart';
import 'mart.dart';

class Worker extends StatefulWidget {
  const Worker({Key? key}) : super(key: key);

  @override
  State<Worker> createState() => _WorkerState();
}

class _WorkerState extends State<Worker> {
  List<String> categories = [
    'Carpentry',
    'Cleaning',
    'Blacksmith',
    'Electrical',
    'Plumbing',
    'Movers',
    'Carpentry',
    'Cleaning',
    'Blacksmith',
    'Electrical',
    'Plumbing',
    'Movers',
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
    '11.png',
    '12.png',
    '13.png',
    '14.png',
    '15.png',
    '17.png',
    '11.png',
    '12.png',
    '13.png',
    '14.png',
    '15.png',
    '17.png',
  ];
  List<String> itemImages1 = [
    '21.png',
    '22.png',
    '23.png',
    '24.png',
    '25.png',
    '27.png',
    '21.png',
    '22.png',
    '23.png',
    '24.png',
    '25.png',
    '27.png',
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
          (MediaQuery.of(context).size.height*.06).heightBox,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: .200 * MediaQuery.of(context).size.height,
            child: Top_part(), // Assuming Top_part is a custom widget for your top section
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text(
              "Worker",
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
          //5.heightBox,
          Expanded(
            child: ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle item click here, you can use the 'index' variable
                    // to determine which item was clicked.
                    String selectedCategory = filteredCategories[index];
                    print("Clicked on category: $selectedCategory");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.123,
                      decoration: BoxDecoration(
                        color: itemColors[index % itemColors.length], // Repeating colors
                        borderRadius: BorderRadius.circular(15.0), // Smaller square shape
                      ),
                      padding: EdgeInsets.all(10.0), // Padding for the content
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              //color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset(
                                'images/${itemImages1[index]}', // Use itemImages list
                                width: 30, // Adjust the width as needed
                                height: 30, // Adjust the height as needed
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            filteredCategories[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Example text color
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              //color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset(
                                'images/${itemImages[index]}', // Use itemImages list
                                width: 30, // Adjust the width as needed
                                height: 30, // Adjust the height as needed
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Mart()),
              );
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
