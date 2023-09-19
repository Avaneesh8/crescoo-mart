import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crescoo_mart/screens/NavigatonBar/pitches.dart';
import 'package:crescoo_mart/screens/NavigatonBar/profile.dart';
import 'package:crescoo_mart/screens/NavigatonBar/worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth_provider.dart';
import '../../widgets/NavBar.dart';
import '../../widgets/Top_part.dart';
import 'mart.dart';

class Product_type extends StatefulWidget {
  final String product_ty;
  const Product_type({Key? key,required this.product_ty}) : super(key: key);

  @override
  State<Product_type> createState() => _Product_typeState();
}

class _Product_typeState extends State<Product_type> {

  List<Color> itemColors = [
    Color(0xFF1A3251),
    Color(0xFFFEC95E),
    Color(0xFF4D8BCF),
    Color(0xFFE1BA8B),
    Color(0xFF6DC9FE),
    Color(0xFF823269),
  ];

  int currentIndex = 1; // Set the initial index for Mart

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final String city = ap.userModel.city;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('items')
        .where(
      'city',
      isEqualTo: city,
    ).where('category',
      isEqualTo: widget.product_ty,)
        .snapshots();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (MediaQuery.of(context).size.height*.06).heightBox,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: .200 * MediaQuery.of(context).size.height,
            child: Top_part(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text(
              "Product Type",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          StreamBuilder(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("something is wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    //scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index)  {
                      return GestureDetector(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // Set a fixed width for each item
                            decoration: BoxDecoration(
                              color: itemColors[index % itemColors.length],
                              // Repeating colors
                              borderRadius: BorderRadius.circular(
                                  25.0), // Smaller square shape
                            ),
                            padding: EdgeInsets.all(10.0),
                            // Padding for the content
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        snapshot.data!.docChanges[index].doc['shop name'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white, // Example text color
                                        ),
                                      ),
                                      Text(
                                        snapshot.data!.docChanges[index].doc['productID'],
                                        textAlign: TextAlign.center,
                                        // Replace with your description
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                          Colors.white, // Example text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        snapshot.data!.docChanges[index].doc['address'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white, // Example text color
                                        ),
                                      ),
                                      Text(
                                        snapshot.data!.docChanges[index].doc['price'].toString(),
                                        textAlign: TextAlign.center,
                                        // Replace with your description
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                          Colors.white, // Example text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
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
