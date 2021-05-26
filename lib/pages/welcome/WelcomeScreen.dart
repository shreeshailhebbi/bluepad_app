import 'package:bluepad_app/Screens/DashBoard/HomePage.dart';
import 'package:bluepad_app/Screens/Login/login_screen.dart';
import 'package:bluepad_app/Screens/Signup/signup_screen.dart';
import 'package:bluepad_app/components/rounded_button.dart';
import 'package:bluepad_app/constants.dart';
import 'package:bluepad_app/pages/welcome/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return SafeArea(
      child: Stack(
        children: [
          Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    "assets/icons/chat.svg",
                    height: size.height * 0.45,
                  ),
                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    color: kPrimaryLightColor,
                    textColor: Colors.black,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: () {
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
                  child: Text(
                    "Skip>>",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 0.5,
                        color: kPrimaryColor),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
