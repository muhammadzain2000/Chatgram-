import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/bottom_navbar.dart';
import 'package:social_app/static/screens/otp_screen.dart';
import 'package:social_app/static/screens/tabbar/tabbar_menu.dart';

class CustomDialog2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //THEMES
    var theme = Theme.of(context);
    //height - width
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Terms and Conditions",
            style: theme.textTheme.headline2,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "terms to be written here",
            style: TextStyle(color: theme.primaryColor, fontSize: 15),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      backgroundColor: theme.primaryColorLight,
      actions: [
        RaisedButton(
            elevation: 0.0,
            child: Text("Agree"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: theme.primaryColorDark,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OtpScreen()));
            }),
        RaisedButton(
            elevation: 0.0,
            color: theme.primaryColorDark,
            child: Text(
              "Disagree",
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
