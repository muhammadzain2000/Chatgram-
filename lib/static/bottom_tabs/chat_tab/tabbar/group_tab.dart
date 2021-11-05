import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/group_model.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/screens/create_group_chat.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/screens/group_chat_screen.dart';

class GroupTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Widget buildNavigationButton() => FloatingActionButton(
          backgroundColor: theme.primaryColorDark,
          child: Icon(Icons.add, color: theme.primaryColorLight),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateGroupChat(),
              ),
            );
          },
        );
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    return Scaffold(
      floatingActionButton: buildNavigationButton(),
      backgroundColor: theme.primaryColorLight,
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (BuildContext context, int index) {
          final Group chat = groups[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GroupChatScreen(
                  user: chat.createdBy,
                  name: chat.name,
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
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage("images/profile_image.jpg"),
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
                                      chat.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
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
