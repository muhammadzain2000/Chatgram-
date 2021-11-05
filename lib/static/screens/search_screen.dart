import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/bottom_navbar.dart';
import 'package:social_app/static/screens/search_people.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        title: Text("Search App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final names = [
    "zain",
    "ebaad",
    "huzaifa",
    "farah",
  ];

  final recentNames = [];

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
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: Row(
          children: [
            SizedBox(
              width: width * 0.02,
            ),
            RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(color: theme.primaryColor, fontSize: 18),
                    children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: theme.primaryColor, fontSize: 18))
                ])),
          ],
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
