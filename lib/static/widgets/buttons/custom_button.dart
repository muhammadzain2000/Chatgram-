import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function onPressed;
  String text;
  CustomButton({this.onPressed, this.text});

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
        width: width,
        height: height * 0.06,
        child: Center(
            child: Text(
          text,
          style: theme.textTheme.headline3,
        )),
      ),
    );
  }
}
