import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatelessWidget {
  Function onPressed;
  String text;
  CustomAnimatedButton({this.onPressed, this.text, this.changeButton});
  bool changeButton;

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //THEME
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: changeButton ? width * 0.2 : width,
        height: height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: theme.primaryColorDark,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: changeButton
                ? Icon(
                    Icons.done,
                    color: theme.accentColor,
                  )
                : Text(
                    text,
                    style: theme.textTheme.headline3,
                  )),
      ),
    );
  }
}
