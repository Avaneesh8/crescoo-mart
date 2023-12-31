import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crescoo_mart/screens/NavigatonBar/profile.dart';
import 'package:crescoo_mart/screens/NavigatonBar/worker/worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth_provider.dart';
import '../../widgets/NavBar.dart';
import '../../widgets/Top_part.dart';
import 'Mart/mart.dart';

class Pitches extends StatefulWidget {
  const Pitches({Key? key}) : super(key: key);

  @override
  State<Pitches> createState() => _PitchesState();
}

class _PitchesState extends State<Pitches> {

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
    // Ensure that AutomaticKeepAlive is properly maintained.
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Pitch').snapshots();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (MediaQuery.of(context).size.height * .06).heightBox,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: .200 * MediaQuery.of(context).size.height,
            child:
                Top_part(), // Assuming Top_part is a custom widget for your top section
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text(
              "Pitches",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          10.heightBox,
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
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index)  {
                      return GestureDetector(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15,bottom: 20,),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // Set a fixed width for each item
                            decoration: BoxDecoration(
                              color: itemColors[index % itemColors.length],
                              // Repeating colors
                              borderRadius: BorderRadius.circular(
                                  35.0), // Smaller square shape
                            ),
                            padding: EdgeInsets.all(10.0),
                            // Padding for the content
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  snapshot.data!.docChanges[index].doc['Business Name'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Example text color
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 40,
                                  color: Colors.white, // Example line color
                                ),
                                (MediaQuery.of(context).size.height * .05)
                                    .heightBox,
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docChanges[index].doc['Business Idea'],
                                      textAlign: TextAlign.center,
                                      // Replace with your description
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Colors.white, // Example text color
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Set your desired border radius here
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * .4,
                                    color: Color.fromRGBO(189, 189, 199, 1),
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.docChanges[index].doc['Phone Number'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docChanges[index].doc['addreass'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
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
                );
              }),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex =
                index; // Update the current index when an item is tapped
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
              // MartPage is already the current page, no need to navigate
              break;
            case 2:
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
