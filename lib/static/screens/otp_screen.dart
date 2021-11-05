import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:social_app/static/bottom_tabs/bottom_navbar.dart';
import 'package:social_app/static/screens/tabbar/sign_in.dart';
import 'package:social_app/static/widgets/buttons/custom_animated_button.dart';
import 'package:social_app/static/widgets/buttons/custom_button.dart';
import 'package:social_app/static/widgets/textfields/custom_textfield.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    // bool otp = false;

    //HEIGHT-WIDTH
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Verify yourself", style: theme.textTheme.headline1),
                SizedBox(height: height * 0.05),
                CustomTextField(
                  type: TextInputType.number,
                  obscureText: false,
                  hint: "Mobile number",
                  label: "Enter a number",
                ),
                SizedBox(height: height * 0.03),
                GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: CustomButton(
                      text: "Continue",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    //HEIGHT-WIDTH
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool verify = false;
    //THEME
    var theme = Theme.of(context);
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text(
          "Enter your 4 digit code",
          style: theme.textTheme.headline2,
        ),
      ),
      content: Container(
        height: height * 0.18,
        child: Column(
          children: [
            OtpTextField(
              enabledBorderColor: theme.primaryColorDark,
              decoration: InputDecoration(),
              numberOfFields: 4,
              showFieldAsBox: true,
              obscureText: false,
              cursorColor: theme.primaryColor,
            ),
            SizedBox(height: height * 0.03),
            CustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()));
                })
          ],
        ),
      ),
      backgroundColor: theme.primaryColorLight,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
