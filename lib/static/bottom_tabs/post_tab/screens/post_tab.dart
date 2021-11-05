import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/post_tab/models/post_model.dart';
import 'package:social_app/static/bottom_tabs/post_tab/screens/comment.dart';
import 'package:social_app/static/bottom_tabs/post_tab/screens/post.dart';

import '../../../widgets/textfields/custom_textfield.dart';

class PostTab extends StatefulWidget {
  @override
  _PostTabState createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
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
                width: width * 0.02,
              ),
              Expanded(
                flex: 2,
                child: CustomTextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Post()));
                  },
                  hintStyle: theme.textTheme.headline5,
                  obscureText: false,
                  hint: "What's on your mind?",
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  PostModel post = posts[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 3,
                          color: theme.primaryColorLight,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          6.0, 2.0, 10.0, 2.0),
                                      child: Container(
                                        width: width * 0.10,
                                        height: height * 0.10,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                              "images/profile_image.jpg",
                                            ))),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(post.name,
                                                style:
                                                    theme.textTheme.bodyText2),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text(
                                                post.time,
                                                style:
                                                    theme.textTheme.headline5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                post.image != "no"
                                    ? Column(
                                        children: [
                                          Text(
                                            post.text,
                                            style: theme.textTheme.headline5,
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          GestureDetector(
                                              onTap: () {},
                                              child: Image(
                                                  image:
                                                      AssetImage(post.image))),
                                          Divider(
                                            height: 2,
                                            color: theme.primaryColorDark,
                                          ),
                                        ],
                                      )
                                    : Text(
                                        post.text,
                                        style: theme.textTheme.headline5,
                                      ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  like = !like;
                                                });
                                              },
                                              child: Row(children: <Widget>[
                                                Icon(
                                                  Icons.thumb_up,
                                                  size: 18,
                                                  color: like
                                                      ? theme.primaryColorDark
                                                      : Colors.grey,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Like',
                                                      style: theme
                                                          .textTheme.headline5),
                                                ),
                                              ])),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Comment(
                                                            image: post.image,
                                                            name: post.name,
                                                            text: post.text,
                                                            time: post.time,
                                                          )));
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.mode_comment,
                                                    color:
                                                        theme.primaryColorDark,
                                                    size: 18),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Comment',
                                                      style: theme
                                                          .textTheme.headline5),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]))
                              ]))));
                }),
          )
        ]),
      ),
    );
  }
}
