import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  Function onPressed;
  String text;
  CustomButton2({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //THEME
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: theme.primaryColorDark,
            borderRadius: BorderRadius.circular(25)),
        width: width*0.4,
        height: height * 0.05,
        child: Center(
            child: Text(
              text,
              style: theme.textTheme.bodyText1,
            )),
      ),
    );
  }
}
