import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/bottom_navbar.dart';
import 'package:social_app/static/screens/otp_screen.dart';
import 'package:social_app/static/widgets/buttons/custom_animated_button.dart';
import 'package:social_app/static/widgets/dialogs/custom_dialog2.dart';

import '../../widgets/buttons/custom_button.dart';
import '../../widgets/textfields/custom_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool google = false;
  bool signUp = false;
  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //THEME
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextField(
              hintStyle: theme.textTheme.headline5,
              obscureText: false,
              hint: "Email",
              icon: Icon(
                Icons.email,
                color: theme.primaryColor,
              ),
              label: "Enter your email",
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
              hintStyle: theme.textTheme.headline5,
              obscureText: true,
              hint: "Password",
              icon: Icon(
                Icons.visibility_off,
                color: theme.primaryColor,
              ),
              label: "Enter your password",
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomAnimatedButton(
              text: "Sign Up",
              changeButton: signUp,
              onPressed: () {
                setState(() {
                  signUp = !signUp;
                });
                Future.delayed(Duration(seconds: 1), () {
                  showDialog(
                      context: context,
                      builder: (context) {return CustomDialog2();});
                });
              },
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                Container(
                  color: Colors.grey,
                  width: width * 0.38,
                  height: height * 0.001,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  "OR",
                  style: theme.textTheme.headline5,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  color: Colors.grey,
                  width: width * 0.38,
                  height: height * 0.001,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomAnimatedButton(
              text: "Sign up with Google",
              changeButton: google,
              onPressed: () {
                setState(() {
                  google = !google;
                });
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OtpScreen()));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
