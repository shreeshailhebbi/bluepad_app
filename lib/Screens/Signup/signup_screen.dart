
import 'package:bluepad_app/Screens/DashBoard/HomePage.dart';
import 'package:bluepad_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:bluepad_app/Screens/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Body(),
            Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    child: Text("Skip>>",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 0.5,color: kPrimaryColor),),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
