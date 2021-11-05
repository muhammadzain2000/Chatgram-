import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/screens/chat_screen.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/message_model.dart';
import 'package:social_app/static/bottom_tabs/chat_tab/models/user_model.dart';
import 'package:social_app/static/bottom_tabs/video_tab/screens/call_screen.dart';
import 'package:social_app/static/screens/search_people.dart';

class FriendsList extends StatefulWidget {
  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEMES
    var theme = Theme.of(context);
    return Scaffold(
      //backgroundColor: theme.primaryColorLight,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                showSearch(context: context, delegate: FriendsSearch());
              })
        ],
      ),
    );
  }
}

class FriendsSearch extends SearchDelegate<String> {
  final names = [
    "zain",
    "ebaad",
    "huzaifa",
    "farah",
  ];

  final recentNames = [
    "zain",
    "ebaad",
    "huzaifa",
    "farah",
  ];

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   //THEMES
  //   var theme = Theme.of(context);
  //   return Theme.of(context).copyWith(
  //     scaffoldBackgroundColor: theme.primaryColorLight,
  //   );
  // }

  @override //actions for app bar
  List<Widget> buildActions(BuildContext context) {
    //THEMES
    var theme = Theme.of(context);
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override //leading icon on the left of the app bar
  Widget buildLeading(BuildContext context) {
    //THEMES
    var theme = Theme.of(context);
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override //show some result based on the selection
  Widget buildResults(BuildContext context) {
    return SearchPeople();
  }

  @override //show when someone searches for something
  Widget buildSuggestions(BuildContext context) {
    //HEIGHT-WIDTH

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEMES
    var theme = Theme.of(context);
    final suggestionList = query.isEmpty
        ? recentNames
        : names
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final Message chat = chats[index];
        var listTile = ListTile(
          onTap: () {
            showResults(context);
          },
          title: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              width: width,
              height: height * 0.12,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: theme.primaryColorLight,
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  image: DecorationImage(
                                      image: AssetImage(chat.sender.imageUrl))),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: suggestionList[index]
                                        .substring(0, query.length),
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 18),
                                    children: [
                                      TextSpan(
                                          text: suggestionList[index]
                                              .substring(query.length),
                                          style: TextStyle(
                                              color: theme.primaryColor,
                                              fontSize: 18))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CallScreen(
                                                names: [suggestionList[index]],
                                                images: [chat.sender.imageUrl],
                                              )));
                                },
                                child: Icon(
                                  Icons.call,
                                  color: theme.primaryColorDark,
                                )),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            GestureDetector(
                                onTap: () {
                                  User user = User(
                                      name: suggestionList[index],
                                      imageUrl: chat.sender.imageUrl,
                                      id: 1,
                                      isOnline: false);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                                user: user,
                                              )));
                                },
                                child: Icon(
                                  Icons.message,
                                  color: theme.primaryColorDark,
                                )),
                          ],
                        )
                      ]),
                ),
              )),
        );
        return listTile;
      },
      itemCount: suggestionList.length,
    );
  }
}
