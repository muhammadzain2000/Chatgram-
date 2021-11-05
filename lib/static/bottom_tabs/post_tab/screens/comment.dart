import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/post_tab/models/comment_model.dart';
import 'package:social_app/static/bottom_tabs/post_tab/widgets/comments_items.dart';

class Comment extends StatefulWidget {
  String image;
  String text;
  String time;
  String name;
  Comment({this.image, this.name, this.text, this.time});
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {

  // List<CommentModel> comments = comments;
  _sendMessageArea() {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: theme.primaryColorLight,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25,
            color: theme.primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                  hintText: 'Write a comment...',
                  hintStyle: theme.textTheme.bodyText1),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: theme.primaryColorDark,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: theme.primaryColor,
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.primaryColorLight,
        title: Text(
          "Comments",
          style: theme.textTheme.headline2,
        ),
      ),
      backgroundColor: theme.primaryColorLight,
      body:
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          // child:
          Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  CommentModel comment = comments[index];
                  return CommentItem(
                    commentModel: comment,
                  );
                }),
          ),
          _sendMessageArea()
        ],
      ),
    );
  }
}
