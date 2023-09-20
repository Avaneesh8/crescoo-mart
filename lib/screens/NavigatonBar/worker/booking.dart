import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crescoo_mart/screens/NavigatonBar/worker/worker.dart';
import 'package:crescoo_mart/widgets/Top_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../auth_provider.dart';
import '../../../widgets/NavBar.dart';
import '../Mart/mart.dart';
import '../pitches.dart';
import '../profile.dart';

class WorkerDetailPage extends StatefulWidget {
  final Map<String, dynamic> workerDetails;
  final Color workerColor;
  final String workerId;

  WorkerDetailPage({required this.workerDetails, required this.workerColor,required this.workerId});

  @override
  State<WorkerDetailPage> createState() => _WorkerDetailPageState();
}

class _WorkerDetailPageState extends State<WorkerDetailPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    // Function to update the worker's status to "working"
    void hireWorker(String workerId) {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      // Replace 'your-collection-name' with the actual name of your Firestore collection
      FirebaseFirestore.instance.collection('workers').doc(workerId).update({
        'status': 'working',
        'work_address':ap.userModel.address,
        'work_owner_name':ap.userModel.name,
        'work_phonenumber':ap.userModel.phoneNumber,
        'booked':'Full Day',
      }).then((_) {
        // Successfully updated the status
        // You can add any additional logic or UI updates here
      }).catchError((error) {
        // Handle any errors that occur during the update
        print('Error updating status: $error');
      });
    }
    void hireWorker1(String workerId) {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      // Replace 'your-collection-name' with the actual name of your Firestore collection
      FirebaseFirestore.instance.collection('workers').doc(workerId).update({
        'status': 'working',
        'work_address':ap.userModel.address,
        'work_owner_name':ap.userModel.name,
        'work_phonenumber':ap.userModel.phoneNumber,
        'booked':'Hourly',
      }).then((_) {
        // Successfully updated the status
        // You can add any additional logic or UI updates here
      }).catchError((error) {
        // Handle any errors that occur during the update
        print('Error updating status: $error');
      });
    }
    // Extract worker details
    String name = widget.workerDetails['name'];
    String gender = widget.workerDetails['gender'];
    String occupation = widget.workerDetails['occupation'];
    String age = widget.workerDetails['age'];
    String yearsOfExperience = widget.workerDetails['years of experience'];
    String perHour = widget.workerDetails['per hour'];
    String perDay = widget.workerDetails['per day'];

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
              "Booking",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          (MediaQuery.of(context).size.height * .03).heightBox,
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: ShapeDecoration(
              color: widget.workerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '$gender',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$occupation',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                    child: Row(
                      children: [
                        Text(
                          yearsOfExperience,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "    Years of experience",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hourly : " + perHour,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Daily : " + perDay,
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
          ),
          (MediaQuery.of(context).size.height * .03).heightBox,
          Text(
            'Hire  ',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    hireWorker1(widget.workerId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Worker()
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(minWidth: 140, minHeight: 50),
                    decoration: BoxDecoration(
                      color: widget.workerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Hourly',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    hireWorker(widget.workerId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Worker()
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(minWidth: 140, minHeight: 50),
                    decoration: BoxDecoration(
                      color: widget.workerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Full Day',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
