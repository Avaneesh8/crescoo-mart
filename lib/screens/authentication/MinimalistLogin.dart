import 'package:crescoo_mart/screens/SignUp.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class MinimalistLogin extends StatelessWidget {
  const MinimalistLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: Color.fromRGBO(253, 253, 253, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(width: 150, image: AssetImage('images/CrescooLogoBlue.png')),
              Text(
                "Crescoo\nWorkers",
                style: TextStyle(
                  color: Color.fromRGBO(26, 50, 81, 1),
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 100,width: 150,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(26, 50, 81, 1),
                      border: Border.all(
                        color: Color.fromRGBO(26, 50, 81, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  width: 250,
                  height: 50,
                  child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 30),)),
                ),
              ),
              SizedBox(height: 30,width: 150,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(189, 189, 199, 1),
                      border: Border.all(
                        color: Color.fromRGBO(189, 189, 199, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  width: 250,
                  height: 50,
                  child: Center(child: Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 30),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
