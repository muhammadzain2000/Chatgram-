import 'package:flutter/material.dart';
import 'package:social_app/static/widgets/buttons/custom_animated_button.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool post = false;
  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Post",
          style: theme.textTheme.headline2,
        ),
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: theme.primaryColor,
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: theme.primaryColorLight,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: theme.primaryColor,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: width * 0.12,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                          "images/profile_image.jpg",
                        ))),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    "Farah Yaqoob",
                    style: theme.textTheme.headline2,
                  ),
                ],
              ),
              Container(
                width: width,
                height: height * 0.001,
                color: theme.primaryColorDark,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Whats on your mind?',
                  hintMaxLines: 4,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: CustomAnimatedButton(
                    text: "Post",
                    changeButton: post,
                    onPressed: () {
                      setState(() {
                        post = !post;
                      });
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
