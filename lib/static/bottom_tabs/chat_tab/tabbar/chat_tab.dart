import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/message_model.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/screens/chat_screen.dart';

class ChatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: chat.sender,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: theme.primaryColorLight,
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        // decoration: chat.unread
                        //     ? BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(40)),
                        //         border: Border.all(
                        //           width: 2,
                        //           color: theme.primaryColor,
                        //         ),
                        //         // shape: BoxShape.circle,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(0.5),
                        //             spreadRadius: 2,
                        //             blurRadius: 5,
                        //           ),
                        //         ],
                        //       )
                        //     : BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(0.5),
                        //             spreadRadius: 2,
                        //             blurRadius: 5,
                        //           ),
                        //         ],
                        //       ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(chat.sender.imageUrl),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      chat.sender.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    chat.sender.isOnline
                                        ? Container(
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            width: 7,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: theme.primaryColorDark,
                                            ),
                                          )
                                        : Container(
                                            child: null,
                                          ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    chat.time,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: theme.primaryColorDark),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                chat.text,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: theme.primaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
