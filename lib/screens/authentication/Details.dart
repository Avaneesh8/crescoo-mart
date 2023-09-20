import 'package:crescoo_mart/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth_provider.dart';
import '../../widgets/NavBar.dart';
import '../../widgets/Top_part.dart';
import '../NavigatonBar/Mart/mart.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final List<String> cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Pune',
  ]; // Add your list of cities here
  String selectedCity = "Mumbai"; // Default city selection

  @override
  Widget build(BuildContext context) {
    name.selection = TextSelection.fromPosition(
      TextPosition(
        offset: name.text.length,
      ),
    );
    address.selection = TextSelection.fromPosition(
      TextPosition(
        offset: address.text.length,
      ),
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: .200 * MediaQuery.of(context).size.height,
                // Include your Top_part widget here
                child: Top_part(),
              ),
              SizedBox(
                width: .25 * MediaQuery.of(context).size.width,
                height: .1 * MediaQuery.of(context).size.height,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      name.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: address,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      address.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Address",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: DropdownButtonFormField(
                  value: selectedCity,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCity = newValue.toString();
                    });
                  },
                  items: cities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () => storeData(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(189, 189, 199, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(189, 189, 199, 1),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 200,
                      maxWidth: .5 * MediaQuery.of(context).size.width,
                    ),
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      createdAt: "",
      phoneNumber: "",
      uid: "",
      name: name.text.trim(),
      address: address.text.trim(),
      city: selectedCity,
    );
    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: () {
        ap.saveUserDataToSP().then(
              (value) => ap.setSignIn().then(
                (value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Mart(),//NavBar(index: 0,),
              ),
                  (route) => false,
            ),
          ),
        );
      },
    );
  }
}
