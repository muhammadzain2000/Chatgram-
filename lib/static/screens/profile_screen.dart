import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/dynamic/providers/theme_provider.dart';
import 'package:social_app/static/screens/tabbar/tabbar_menu.dart';
import 'package:social_app/static/widgets/buttons/custom_animated_button.dart';
import 'package:social_app/static/widgets/buttons/custom_button.dart';
import 'package:social_app/static/widgets/dialogs/custom_dialog.dart';
import 'package:social_app/static/widgets/textfields/custom_textfield.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  bool save = false;
  //ANIMATIONS
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                height: height * 0.3,
                color: theme.accentColor,
              ),
            ),
            Container(height: height * 0.7, color: theme.primaryColorLight),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Profile',
              style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              width: width * 0.9,
              height: height * 0.25,
              child: Card(
                elevation: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: theme.primaryColorLight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/profile_image.jpg'),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Ebad Ullah',
                      style: theme.textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: height * 0.0001,
                    ),
                    Text(
                      'ebadullah371@gmail.com',
                      style: theme.textTheme.bodyText2,
                    )
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        0.0, animation.value * width, 0.0),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.01,
                          left: width * 0.2,
                          right: width * 0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomButton(
                            text: 'Edit Profile',
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: theme.primaryColorLight,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      content: Container(
                                        height: height * 0.25,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            CustomTextField(
                                              hint: 'Edit name',
                                              obscureText: false,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            CustomButton(
                                              text: "Save",
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Consumer<ThemeProvider>(
                            builder: (context, notifier, child) => CustomButton(
                              text: 'Theme',
                              onPressed: () {
                                notifier.toggleTheme();
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomButton(
                            text: 'Logout',
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomDialog(
                                        btn1Text: "Ok",
                                        btn2Text: "Cancel",
                                        title: "Logout?",
                                        onOkPressed: () async {
                                          // await authService.signOut();
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TabbarMenu()));
                                        });
                                  });
                            },
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CustomButton(
                            text: 'Back',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ]),
    );
  }
}
