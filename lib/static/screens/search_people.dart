import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/screens/chat_screen.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/user_model.dart';
import 'package:social_app/static/bottom_tabs/post_tab/models/post_model.dart';
import 'package:social_app/static/bottom_tabs/post_tab/screens/comment.dart';
import 'package:social_app/static/widgets/buttons/custom_button2.dart';

class SearchPeople extends StatefulWidget {
  @override
  _SearchPeopleState createState() => _SearchPeopleState();
}

class _SearchPeopleState extends State<SearchPeople> {
  bool friend = false;
  bool block = false;
  bool like = false;
  bool call = false;
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
                color: theme.primaryColorLight,
              ),
            ),
            Container(height: height * 0.72, color: theme.primaryColorLight),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.9,
              height: height * 0.19,
              child: Card(
                // margin: EdgeInsets.symmetric(horizontal: 30),
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
                    // Text(
                    //   'ebadullah371@gmail.com',
                    //   style: theme.textTheme.bodyText2,
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.01,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton2(
                        text: friend ? 'Unfriend' : 'Add friend',
                        onPressed: () {
                          setState(() {
                            friend = !friend;
                          });
                        },
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      CustomButton2(
                        text: block ? 'Unblock' : 'Block',
                        onPressed: () {
                          setState(() {
                            block = !block;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton2(
                          text: "Message",
                          onPressed: () {
                            User user = User(
                                isOnline: false,
                                id: 0,
                                imageUrl: "images/profile_image.jpg",
                                name: "Ebad Ullah");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          user: user,
                                        )));
                          }),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      CustomButton2(
                        text: call ? 'Requested' : 'Call',
                        onPressed: () {
                          setState(() {
                            call = !call;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Posts',
                    style: TextStyle(color: theme.primaryColor, fontSize: 25),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    // physics: ScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      PostModel post = posts[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 3,
                              color: theme.primaryColorLight,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                                    style: theme
                                                        .textTheme.bodyText2),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    post.time,
                                                    style: theme
                                                        .textTheme.headline5,
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
                                                style:
                                                    theme.textTheme.headline5,
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              GestureDetector(
                                                  onTap: () {},
                                                  child: Image(
                                                      image: AssetImage(
                                                          post.image))),
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
                                                          ? theme
                                                              .primaryColorDark
                                                          : Colors.grey,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text('Like',
                                                          style: theme.textTheme
                                                              .headline5),
                                                    ),
                                                  ])),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Comment(
                                                                image:
                                                                    post.image,
                                                                name: post.name,
                                                                text: post.text,
                                                                time: post.time,
                                                              )));
                                                },
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.mode_comment,
                                                        color: theme
                                                            .primaryColorDark,
                                                        size: 18),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text('Comment',
                                                          style: theme.textTheme
                                                              .headline5),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]))
                                  ]))));
                    }))
          ],
        ),
      ]),
    );
  }
}
