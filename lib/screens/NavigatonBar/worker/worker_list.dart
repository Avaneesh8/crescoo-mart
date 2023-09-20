import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crescoo_mart/screens/NavigatonBar/worker/worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../auth_provider.dart';
import '../../../widgets/NavBar.dart';
import '../../../widgets/Top_part.dart';
import '../Mart/mart.dart';
import '../pitches.dart';
import '../profile.dart';
import 'booking.dart';

class Worker_list extends StatefulWidget {
  final selectedcategory;
  const Worker_list({Key? key, this.selectedcategory}) : super(key: key);

  @override
  State<Worker_list> createState() => _Worker_listState();
}

class _Worker_listState extends State<Worker_list> {
  List<Color> itemColors = [
    Color(0xFF1A3251),
    Color(0xFFFEC95E),
    Color(0xFF4D8BCF),
    Color(0xFFE1BA8B),
    Color(0xFF6DC9FE),
    Color(0xFF823269),
  ];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final String city = ap.userModel.city;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('workers')
        .where('city', isEqualTo: city,)
        .where('status', isEqualTo: 'not working')
    .where('occupation',isEqualTo: widget.selectedcategory)
        .snapshots();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (MediaQuery.of(context).size.height * .06).heightBox,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: .200 * MediaQuery.of(context).size.height,
            child: Top_part(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text(
              "Workers",
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
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkerDetailPage(
                                workerDetails: snapshot.data!.docs[index].data() as Map<String, dynamic>,
                                workerColor: itemColors[index % itemColors.length],
                                workerId: snapshot.data!.docs[index].id,
                                // Pass worker details here
                              ),
                            ),
                          );
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
                                  padding: const EdgeInsets.only(left:25,right: 25,top: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data!.docChanges[index].doc['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docChanges[index].doc['gender'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.data!.docChanges[index].doc['years of experience'].toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                " Years of experience",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            snapshot.data!.docChanges[index].doc['age'].toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Hourly: " + snapshot.data!.docChanges[index].doc['per hour'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Daily: " + snapshot.data!.docChanges[index].doc['per day'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
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
