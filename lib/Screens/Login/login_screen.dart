import 'package:bluepad_app/Screens/DashBoard/HomePage.dart';
import 'package:bluepad_app/Screens/Signup/signup_screen.dart';
import 'package:bluepad_app/UserService.dart';
import 'package:bluepad_app/components/already_have_an_account_acheck.dart';
import 'package:bluepad_app/components/rounded_button.dart';
import 'package:bluepad_app/components/rounded_input_field.dart';
import 'package:bluepad_app/components/rounded_password_field.dart';
import 'package:bluepad_app/constants.dart';
import 'package:bluepad_app/pages/welcome/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  UserService userService = UserService();
  String username;
  String password;

  showSnackBarMsg(msg) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(duration: Duration(seconds: 5), content: new Text(msg)));
  }

  handleLogin() async {
    FocusScope.of(context).unfocus();
    if (username != null && password != null) {
      bool _isLoggedIn = await userService.login(username, password);

      if (_isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      }
      showSnackBarMsg("Invalid Username and Password");
    }
    showSnackBarMsg("Enter Username and Password");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      press: () {
                        handleLogin();
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
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
      ),
    );
  }
}
