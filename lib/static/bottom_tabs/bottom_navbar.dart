import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:social_app/static/bottom_tabs/chat_tab/tabbar/chat_tab.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/message_model.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/tabbar/chat_tabbar_menu.dart';
import 'package:social_app/static/bottom_tabs/post_tab/screens/post_tab.dart';
import 'package:social_app/static/bottom_tabs/video_tab/screens/video_call_tab.dart';
import 'package:social_app/static/screens/friends_screen.dart';
import 'package:social_app/static/screens/profile_screen.dart';
import 'package:social_app/static/screens/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  //screen names will be written here

  final screen = [ChatTabBarMenu(), PostTab(), VideoCallTab()];

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //THEMES
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.chat_outlined,
            size: 25,
            color: theme.primaryColorLight,
          ),
          Icon(
            Icons.list_rounded,
            size: 30,
            color: theme.primaryColorLight,
          ),
          Icon(
            Icons.call,
            size: 25,
            color: theme.primaryColorLight,
          ),
        ],
        color: theme.primaryColor,
        buttonBackgroundColor: theme.primaryColorDark,
        backgroundColor: theme.primaryColorLight,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryColorLight,
        title: Text(
          "Chatgram",
          style: theme.textTheme.headline1,
        ),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: theme.primaryColorDark,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: FriendsSearch());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person_add,
                  color: theme.primaryColorDark,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: theme.primaryColorDark,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ],
          )
        ],
      ),
      body: screen[_page],

      // bottomNavigationBar: CurvedNavigationBar(
      //   index: 0,
      //   height: 60.0,
      //   items: <Widget>[
      //     Icon(
      //       Icons.list_rounded,
      //       size: 30,
      //     ),
      //     Icon(Icons.chat_outlined, size: 30),
      //     Icon(Icons.call, size: 30),
      //   ],
      //   color: theme.primaryColor,
      //   buttonBackgroundColor: theme.primaryColorDark,
      //   backgroundColor: theme.primaryColorLight,
      //   animationCurve: Curves.easeInOut,
      //   animationDuration: Duration(milliseconds: 600),
      //   onTap: (index) {
      //     setState(() {
      //       _page = index;
      //     });
      //   },
      //   letIndexChange: (index) => true,
      // ),
      // appBar: AppBar(
      //   title: CustomSearchBar(),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      // body: screen[_page],
      // backgroundColor: theme.primaryColorLight,
    );
  }
}
