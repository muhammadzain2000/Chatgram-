import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/group_model.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/user_model.dart';
import 'package:social_app/static/bottom_tabs/video_tab/screens/call_screen.dart';
import 'package:social_app/static/widgets/dialogs/custom_dialog.dart';

class GroupChatScreen extends StatefulWidget {
  User user;
  String name;
  GroupChatScreen({this.user, this.name});
  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  _chatBubble(GroupMessage message, bool isMe, bool isSameUser) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: theme.primaryColorDark,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColorDark.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.sender.name,
                      style: TextStyle(
                          fontSize: 12, color: theme.primaryColorDark),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: theme.primaryColor.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: theme.primaryColorLight,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: theme.primaryColorLight.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.sender.name,
                      style: TextStyle(
                          fontSize: 12, color: theme.primaryColorDark),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

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
                  hintText: 'Send a message..',
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
    bool msg = false;
    int prevUserId;
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: theme.primaryColorLight,
        title: Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.name,
                  style: theme.textTheme.headline2,
                ),
                TextSpan(text: '\n'),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add_call),
              color: theme.primaryColorDark,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallScreen(
                              images: ["images/profile_image.jpg"],
                              names: [widget.user.name],
                            )));
              }),
          IconButton(
              icon: Icon(Icons.wifi_protected_setup_sharp),
              color: theme.primaryColorDark,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialog(
                        title: msg
                            ? "Disable self-destruct timer ?"
                            : "Enable self-destruct timer ?",
                        btn1Text: "Yes",
                        btn2Text: "No",
                        onOkPressed: () {
                          msg = !msg;
                          Navigator.pop(context);
                        },
                      );
                    });
              }),
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: theme.primaryColor,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final GroupMessage message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
